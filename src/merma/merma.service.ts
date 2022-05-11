import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment';
import { Sku } from 'src/sku/entities/sku.entity';
import { Between, Connection, MoreThan, Not, Repository } from 'typeorm';
import { CreateMermaDto } from './dto/create-merma.dto';
import { UpdateMermaDto } from './dto/update-merma.dto';
import { Merma } from './entities/merma.entity';
import { Ranch } from './entities/ranch.entity';
import { IFindMerma } from './Interface/InterfaceMerma';

@Injectable()
export class MermaService {
  constructor(
    @InjectRepository(Merma)
    private MermaRepository: Repository<Merma>,
    private connection: Connection,
  ) {}
  async create(createMermaDto: CreateMermaDto) {
    const { rCortado, rProcesado, pesoFruta } = createMermaDto;
    createMermaDto.rCortado = pesoFruta * rCortado;
    createMermaDto.rProcesado = pesoFruta * rProcesado;
    const rRechazado = createMermaDto.rCortado - createMermaDto.rProcesado;

    const cajas = createMermaDto.skuCajas.map((caja) => {
      return { cantidad: caja.cantidad, peso: caja.sku.peso };
    });

    const pesoCaja = cajas.map((caja) => {
      return caja.peso * caja.cantidad;
    });

    const totalPesoCaja = pesoCaja.reduce((a, b) => a + b, 0);

    const pesoProcesado = createMermaDto.rProcesado - totalPesoCaja;
    const pesoRechazado = pesoProcesado + rRechazado;

    const merma = this.MermaRepository.create({
      ...createMermaDto,
      rRechazados: rRechazado,
      pesoTallo: createMermaDto.pesoTallo,
      totalCajas: totalPesoCaja,
      mermaProcesada: pesoProcesado,
      mermaCortada: pesoRechazado,
      ratioC: totalPesoCaja / 42 / rCortado,
      ratioP: totalPesoCaja / 42 / rProcesado,
      pesoCaja: totalPesoCaja,
    });

    const exist = await this.MermaRepository.findOne({
      ranch: createMermaDto.ranch,
      fecha: moment().format('YYYY-MM-DD'),
    });

    await this.connection.manager.save(merma.cajas);
    await this.connection.manager.save(merma.coloredBunches);
    await this.connection.manager.save(merma.DesgloceManos);
    await this.connection.manager.save(merma.rejectedBunches);

    if (exist) {
      const response = await this.MermaRepository.save({
        ...merma,
        id: exist.id,
      });
      return response;
    } else {
      const response = await this.MermaRepository.save(merma);
      return response;
    }
  }

  async createResagados(createMermaDto: CreateMermaDto) {
    const { rCortado, rProcesado, pesoFruta } = createMermaDto;
    createMermaDto.rCortado = pesoFruta * rCortado;
    createMermaDto.rProcesado = pesoFruta * rProcesado;
    const rRechazado = createMermaDto.rCortado - createMermaDto.rProcesado;

    const cajas = createMermaDto.skuCajas.map((caja) => {
      return { cantidad: caja.cantidad, peso: caja.sku.peso };
    });

    const pesoCaja = cajas.map((caja) => {
      return caja.peso * caja.cantidad;
    });

    const totalPesoCaja = pesoCaja.reduce((a, b) => a + b, 0);

    const pesoProcesado = createMermaDto.rProcesado - totalPesoCaja;
    const pesoRechazado = pesoProcesado + rRechazado;

    const merma = this.MermaRepository.create({
      ...createMermaDto,
      rRechazados: rRechazado,
      pesoTallo: createMermaDto.pesoTallo,
      totalCajas: totalPesoCaja,
      mermaProcesada: pesoProcesado,
      mermaCortada: pesoRechazado,
      ratioC: totalPesoCaja / 42 / rCortado,
      ratioP: totalPesoCaja / 42 / rProcesado,
      pesoCaja: totalPesoCaja,
    });

    await this.connection.manager.save(merma.cajas);
    await this.connection.manager.save(merma.coloredBunches);
    await this.connection.manager.save(merma.DesgloceManos);
    await this.connection.manager.save(merma.rejectedBunches);

    const response = await this.MermaRepository.save({
      id: createMermaDto.resagados.id,
      ...merma,
    });
    return response;
  }

  async findByRanch(ranch: number) {
    const mermas = await this.MermaRepository.findOne({
      where: { ranch, fecha: moment().format('YYYY-MM-DD') },
    });
    return mermas;
  }

  findAll() {
    return `This action returns all merma`;
  }

  async findResagadas(ranch: number) {
    const mermas = await this.MermaRepository.find({
      where: { ranch, mermaCortada: 0 },
      relations: ['ranch'],
    });
    return mermas;
  }

  async findOne(findMermaDto: IFindMerma) {
    //consulta a la base de datos

    const merma = await this.MermaRepository.find({
      where: {
        fecha: Between(findMermaDto.fechaInicio, findMermaDto.fechaFin),
        ranch: findMermaDto.ranch,
        mermaCortada: MoreThan(0),
      },
      relations: [
        'coloredBunches',
        'cajas',
        'cajas.sku',
        'ranch',
        'DesgloceManos',
        'DesgloceManos.defecto',
        'DesgloceManos.defecto.tipoDefecto',
        'perfilRacimos',
        'perfilRacimos.pesoMano',
        'perfilRacimos.numeroDedos',
        'perfilRacimos.DesgloceMermas',
        'perfilRacimos.DesgloceMermas.defecto',
        'perfilRacimos.DesgloceMermas.defecto.tipoDefecto',
      ],
      order: {
        fecha: 'ASC',
      },
    });

    //mapeo de la consulta

    const mermaHaciendad = merma.map((merma) => {
      const {
        rCortado,
        rProcesado,
        mermaProcesada,
        mermaCortada,
        pesoFruta,
        rRechazados,
        totalCajas,
      } = merma;

      //calculo de porcentajes
      const porcentajeContado = (mermaCortada / rCortado) * 100;
      const porcentajeProcesado = (mermaProcesada / rProcesado) * 100;
      const porcentajeAprobechado =
        ((rCortado - mermaCortada) / rCortado) * 100;

      const total = porcentajeAprobechado + porcentajeContado;

      //convertimos el peso de la merma a racimos dividiendo por el peso promedio de la fruta
      const racimosMerma = Math.round(mermaCortada / pesoFruta);

      //Calculamos la diferrencia entre el peso de los racimos cortados con la merma cortada
      //para saber el aprobechamiento que hubo
      const racimosAprobechado = Math.round(
        (rCortado - mermaCortada) / pesoFruta,
      );

      const promPrimeraMano =
        merma.perfilRacimos.length > 0 &&
        merma.perfilRacimos
          .map((perfil) => {
            return perfil.pesoMano.reduce((a, b) => {
              if (b.numMano === 1) {
                return a + b.pesoMano;
              }
              return a;
            }, 0);
          })
          .reduce((a, b) => a + b, 0) / merma.perfilRacimos.length;

      const promUltimaMano =
        merma.perfilRacimos.length > 0 &&
        merma.perfilRacimos
          .map((perfil) => {
            return perfil.pesoMano.reduce((a, b) => {
              if (b.numMano === perfil.pesoMano.length) {
                return a + b.pesoMano;
              }
              return a;
            }, 0);
          })
          .reduce((a, b) => a + b, 0) / merma.perfilRacimos.length;

      const pesoPromedioPriMano = promPrimeraMano / 454;
      const pesoPromedioUltMano = promUltimaMano / 454;

      const cantidadPriManos = merma.DesgloceManos.reduce((a, b) => {
        if (b.numManosPr > 1) {
          return a + b.numManosPr;
        }
        return a;
      }, 0);

      const cantidadUltManos =
        merma.DesgloceManos &&
        merma.DesgloceManos.length > 0 &&
        merma.DesgloceManos.reduce((a, b) => {
          if (b.numManosUl > 1) {
            return a + b.numManosUl;
          }
          return a;
        }, 0);

      const pesoUltManoBotada = cantidadUltManos * pesoPromedioUltMano;
      const pesoPriManoBotada = cantidadPriManos * pesoPromedioPriMano;

      const totalPesoManos = pesoPriManoBotada + pesoUltManoBotada;

      const ranch = merma.ranch instanceof Ranch && merma.ranch;

      //obtenemos el promedio de dedos de los racimos
      const promDedos =
        merma.perfilRacimos.length > 0 &&
        merma.perfilRacimos
          .map((perfil) => {
            const numDedos = perfil.numeroDedos.reduce(
              (a, b) => a + b.numDedos,
              0,
            );
            return numDedos;
          })
          .reduce((a, b) => a + b, 0) / merma.perfilRacimos.length;

      //separamos los perfiles
      const racimosEvaluados = merma.perfilRacimos.length;
      const pesoRacimosEvaluados = racimosEvaluados * pesoFruta;
      const manosEvaluadas = racimosEvaluados * merma.nManos;
      const promDedosEvaluados = racimosEvaluados * promDedos;
      const promDedosPorMano = promDedosEvaluados / merma.nManos;

      const evaluacion = [
        { promDedosEvaluados },
        { manosEvaluadas },
        { racimosEvaluados },
        { pesoRacimosEvaluados },
      ];

      const mermaSinRacimos = mermaCortada - (rRechazados + totalPesoManos);

      const manosMerma = merma.DesgloceManos.map((desgloce) => {
        const primera = desgloce.numManosPr * pesoPromedioPriMano;
        const ultima = desgloce.numManosUl * pesoPromedioUltMano;
        const peso = primera + ultima;
        const racimos = Math.round(peso / pesoFruta);
        const porcentaje = peso / mermaSinRacimos;
        const manos = racimos * merma.nManos;
        const dedos = racimos * promDedos;
        const porcentajeMM = (porcentaje * porcentajeContado) / 100;
        if (desgloce.defecto) {
          return {
            tipoDefecto: desgloce.defecto.tipoDefecto.nombre,
            defecto: desgloce.defecto.nombre,
            pesoRechazado: Number(peso.toFixed(2)),
            racimos,
            manos,
            dedos,
            porcentaje,
            porcentajeMM,
          };
        } else {
          undefined;
        }
      });

      let dedos = [];

      racimosEvaluados > 0 &&
        merma.perfilRacimos.map((perfil) => {
          const dedosMerma = perfil.DesgloceMermas.map((dedo) => {
            return {
              tipoDaño: dedo.defecto.tipoDefecto.nombre,
              defecto: dedo.defecto.nombre,
              cantidad: dedo.cantidad,
            };
          });
          dedos = dedos.concat(dedosMerma);
          return dedosMerma;
        });

      const nuevoObjeto = {};

      //Recorremos el arreglo
      dedos.forEach((x) => {
        //Si el objeto no existe lo creamos
        if (!nuevoObjeto[x.defecto]) {
          nuevoObjeto[x.defecto] = {
            tipoDefecto: x.tipoDaño,
            defecto: x.defecto,
            dedos: x.cantidad,
            manos: x.cantidad,
            racimos: x.cantidad,
            pesoRacimo: x.cantidad,
          };
        } else {
          //Si el objeto existe lo sumamos
          nuevoObjeto[x.defecto].dedos += x.cantidad;
          nuevoObjeto[x.defecto].manos += x.cantidad;
          nuevoObjeto[x.defecto].racimos += x.cantidad;
          nuevoObjeto[x.defecto].pesoRacimo += x.cantidad;
        }
      });

      const defectosMerma = Object.values<any>(nuevoObjeto).map((defecto) => {
        const racimos = defecto.racimos / promDedosEvaluados;
        const pesoRacimo = racimos * pesoFruta;
        const manos = defecto.manos / promDedosPorMano;
        const dedos = defecto.dedos;
        const porcentajeRV = (pesoRacimo / pesoRacimosEvaluados) * 100;
        return {
          tipoDefecto: defecto.tipoDefecto,
          defecto: defecto.defecto,
          dedos,
          manos,
          racimos,
          pesoRacimo,
          porcentajeRV,
        };
      });

      const pesoMermaEv = defectosMerma.reduce((a, b) => a + b.pesoRacimo, 0);

      const aux = {};

      const defectosMerma2 = defectosMerma.map((defecto, index) => {
        const porcentajeMM = (defecto.pesoRacimo / pesoMermaEv) * 100;
        aux[index] = {
          porcentajeMM,
          defecto: defecto.defecto,
          tipoDefecto: defecto.tipoDefecto,
        };
        return {
          ...defecto,
          porcentajeMM,
        };
      });

      //descontamos el peso de los racimos rechazados del merma total
      const porcentajeRacimoRechazado = rRechazados / mermaCortada;

      const defectosMermaGeneral = Object.values<any>(aux).map((defecto) => {
        const pesoRechazado = (mermaSinRacimos / 100) * defecto.porcentajeMM;
        const porcentaje = pesoRechazado / mermaCortada;
        const racimos = pesoRechazado / pesoFruta;
        const manos = racimos * merma.nManos;
        const dedos = racimos * promDedos;
        const porcentajeMM = (porcentaje * porcentajeContado) / 100;
        return {
          ...defecto,
          dedos: Math.round(dedos),
          manos: Math.round(manos),
          racimos: Math.round(racimos),
          pesoRechazado: Number(pesoRechazado.toFixed(2)),
          porcentaje,
          porcentajeMM,
        };
      });

      const racimosDefectos = rRechazados / pesoFruta;
      const manosDefectos = racimosDefectos * merma.nManos;
      const dedosDefectos = racimosDefectos * promDedos;

      defectosMermaGeneral.unshift({
        tipoDefecto: 'Cosecha',
        defecto: 'Racimos rechazados',
        dedos: Math.round(dedosDefectos),
        manos: Math.round(manosDefectos),
        racimos: Math.round(racimosDefectos),
        pesoRechazado: Number(rRechazados.toFixed(2)),
        porcentaje: porcentajeRacimoRechazado,
        porcentajeMM: (porcentajeRacimoRechazado * porcentajeContado) / 100,
      });

      const mamnos = manosMerma.some((mano) => {
        if (mano) {
          return true;
        }
        return false;
      });

      if (mamnos) {
        defectosMermaGeneral.push(...manosMerma);
      }

      const totalPorcentajeDefectos = defectosMermaGeneral.reduce((a, b) => {
        return a + b.porcentaje;
      }, 0);

      const generalMermaObject = {};

      //Recorremos el arreglo
      defectosMermaGeneral.forEach((x) => {
        //Si el objeto no existe lo creamos
        if (!generalMermaObject[x.defecto]) {
          generalMermaObject[x.defecto] = {
            tipoDefecto: x.tipoDefecto,
            defecto: x.defecto,
            dedos: x.dedos,
            manos: x.manos,
            racimos: x.racimos,
            pesoRechazado: x.pesoRechazado,
            porcentaje: x.porcentaje,
            porcentajeMM: x.porcentajeMM,
          };
        } else {
          //Si el objeto existe lo sumamos
          generalMermaObject[x.defecto].dedos += x.dedos;
          generalMermaObject[x.defecto].manos += x.manos;
          generalMermaObject[x.defecto].racimos += x.racimos;
          generalMermaObject[x.defecto].pesoRechazado += x.pesoRechazado;
          generalMermaObject[x.defecto].porcentaje += x.porcentaje;
          generalMermaObject[x.defecto].porcentajeMM += x.porcentajeMM;
        }
      });

      const cajaType = merma.cajas.map((caja) => {
        if (caja.sku instanceof Sku) {
          if (caja.sku.tercero) {
            return {
              tipo: 'Terceros',
              ...caja,
            };
          }
          return {
            tipo: 'propia',
            ...caja,
          };
        }
      });

      const manosObject = {};

      mamnos &&
        manosMerma.forEach((x) => {
          //Si el objeto no existe lo creamos
          if (!manosObject[x.defecto]) {
            manosObject[x.defecto] = {
              tipoDefecto: x.tipoDefecto,
              defecto: x.defecto,
              dedos: x.dedos,
              manos: x.manos,
              racimos: x.racimos,
              pesoRechazado: x.pesoRechazado,
              porcentaje: x.porcentaje,
              porcentajeMM: x.porcentajeMM,
            };
          } else {
            //Si el objeto existe lo sumamos
            manosObject[x.defecto].dedos += x.dedos;
            manosObject[x.defecto].manos += x.manos;
            manosObject[x.defecto].racimos += x.racimos;
            manosObject[x.defecto].pesoRechazado += x.pesoRechazado;
            manosObject[x.defecto].porcentaje += x.porcentaje;
            manosObject[x.defecto].porcentajeMM += x.porcentajeMM;
          }
        });

      return {
        coloredBunches: merma.coloredBunches,
        defectosMermaGeneral: Object.values<any>(generalMermaObject),
        manosMerma: Object.values<any>(manosObject),
        totalPesoManos: Number(totalPesoManos.toFixed(2)),
        totalPesoManosRacimos: Math.round(totalPesoManos / pesoFruta),
        cantidadUltManos,
        cantidadPriManos,
        pesoRacimosAprobechados: rCortado - mermaCortada,
        totalPorcentajeDefectos,
        defectosMerma2,
        defectosMerma,
        defectos: nuevoObjeto,
        evaluacion,
        ranch,
        pesoMerma: Number(merma.mermaCortada.toFixed(2)),
        porcentajeContado: porcentajeContado.toFixed(2),
        porcentajeProcesado: porcentajeProcesado.toFixed(2),
        porcentajeAprobechado: Math.round(porcentajeAprobechado),
        racimosMerma: Math.round(racimosMerma),
        racimosAprobechado: Math.round(racimosAprobechado),
        racimosCortados: Math.round(rCortado / pesoFruta),
        racimosProcesados: Math.round(rProcesado / pesoFruta),
        racimosRechazados: Math.round(rRechazados / pesoFruta),
        cantidadCajaProcesada: Math.round(totalCajas / 42),
        pesoRacimo: merma.pesoRacimo,
        pesoTallo: merma.pesoTallo,
        pesoFruta: merma.pesoFruta,
        calibracionPromedio: merma.calibracion,
        manosPromedio: merma.nManos,
        edadPromedio: merma.edad,
        largoDedos: merma.lDedoSegunda,
        ratioc: merma.ratioC.toFixed(2),
        ratiop: merma.ratioP.toFixed(2),
        total,
        cajaType,
        date: merma.fecha,
      };
    });

    return mermaHaciendad;
  }

  async findByDate(date: string) {
    const yesterday = moment(date).subtract(1, 'days').format('YYYY-MM-DD');
    const merma2 = await this.MermaRepository.find({
      where: {
        fecha: Between(yesterday, date),
      },
      relations: ['ranch'],
    });
    return merma2;
  }

  async history(ranch: number) {
    const merma = await this.MermaRepository.find({
      where: {
        ranch: ranch,
      },
      relations: ['ranch'],
    });
    return merma;
  }

  async followByMerma() {
    const now = moment().format('YYYY-MM-DD');
    const followUp = await this.MermaRepository.find({
      where: {
        fecha: now,
      },
      relations: ['ranch', 'ranch.zona', 'perfilRacimos'],
      order: {
        ranch: 'ASC',
      },
    });

    const resagadas = await this.MermaRepository.find({
      where: {
        mermaCortada: 0,
      },
      order: {
        fecha: 'ASC',
      },
      relations: ['ranch'],
    });

    return { followUp, resagadas };
  }

  update(id: number, updateMermaDto: UpdateMermaDto) {
    return `This action updates a #${id} merma`;
  }

  async remove(id: number) {
    const exist = await this.MermaRepository.findOne(id);
    if (!exist) {
      throw new NotFoundException(`Merma with id ${id} not found`);
    }
    await this.MermaRepository.delete(id);
    return `Merma with id ${id} deleted`;
  }
}
