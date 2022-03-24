import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CajasService } from 'src/cajas/cajas.service';
import { CreateCajaDto } from 'src/cajas/dto/create-caja.dto';
import { Between, Repository } from 'typeorm';
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
    private cajasService: CajasService,
  ) {}
  async create(createMermaDto: CreateMermaDto) {
    const { rCortado, rProcesado, pesoFruta } = createMermaDto;
    createMermaDto.rCortado = pesoFruta * rCortado;
    createMermaDto.rProcesado = pesoFruta * rProcesado;
    const rRechazado = createMermaDto.rCortado - createMermaDto.rProcesado;

    const cajas = createMermaDto.skuCajas.map((caja) => {
      return { cantidad: caja.caja.cantidad, peso: caja.sku.peso };
    });

    const cajaR = createMermaDto.skuCajas.map((caja) => {
      return { cantidad: caja.cajaR.cantidad, peso: caja.sku.peso };
    });

    const pesoCaja = cajas.map((caja) => {
      return caja.peso * caja.cantidad;
    });

    const pesoCajaR =
      cajaR?.length > 0 &&
      cajaR.map((caja) => {
        return caja.peso * caja.cantidad;
      });

    const totalPesoCaja = pesoCaja.reduce((a, b) => a + b, 0);
    const totalPesoRCaja = pesoCajaR ? pesoCajaR.reduce((a, b) => a + b, 0) : 0;

    const pesoProcesado = createMermaDto.rProcesado - totalPesoCaja;
    const pesoRechazado = pesoProcesado + rRechazado;

    const merma = this.MermaRepository.create({
      ...createMermaDto,
      rRechazados: rRechazado,
      pesoTallo: createMermaDto.pesotallo,
      totalCajas: totalPesoCaja,
      mermaProcesada: pesoProcesado,
      mermaCortada: pesoRechazado,
      ratioC: totalPesoCaja / 42 / rCortado,
      ratioP: totalPesoCaja / 42 / rProcesado,
      pesoCaja: totalPesoCaja,
    });
    const save = await this.MermaRepository.save(merma);
    const cajasAp = createMermaDto.skuCajas.map((skuCaja): CreateCajaDto => {
      return {
        cantidad: skuCaja.caja.cantidad,
        sku: skuCaja.sku,
        merma: save.id,
        cantidadR: skuCaja.cajaR.cantidad,
      };
    });
    await this.cajasService.create(cajasAp);

    const porcentajeRechazado =
      (pesoProcesado / createMermaDto.rProcesado) * 100;
    const procentajeCRechazado =
      (pesoRechazado / createMermaDto.rCortado) * 100;

    const rAprobechado = createMermaDto.rCortado - pesoRechazado;

    const porcentajeRAprobechado =
      ((totalPesoCaja - rAprobechado) * 100) / rAprobechado;

    return {
      rCortado: createMermaDto.rCortado,
      rProcesado: createMermaDto.rProcesado,
      rRechazado: rRechazado / pesoFruta,
      pesoCaja: pesoCaja,
      pesoCajaR: pesoCajaR || 0,
      mermaProcesado: pesoProcesado / pesoFruta,
      mermaRechazado: pesoRechazado / pesoFruta,
      mermaPesoRechazo: pesoRechazado,
      porcentajeRechazado,
      procentajeCRechazado,

      RacimoAprovechado: rAprobechado / pesoFruta,
      porcentajeRAprobechado,
      pesoCajaRacimoRechazado: totalPesoRCaja / pesoFruta,
      racimosMerma: (rAprobechado * porcentajeRAprobechado) / 100 / pesoFruta,
      menssaage: 'Merma creada con exito',
    };
  }

  findAll() {
    return `This action returns all merma`;
  }

  async findOne(findMermaDto: IFindMerma) {
    const merma = await this.MermaRepository.find({
      where: {
        fecha: Between(findMermaDto.fechaInicio, findMermaDto.fechaFin),
        ranch: findMermaDto.ranch,
      },
      relations: [
        'cajas',
        'cajas.sku',
        'ranch',
        'perfilRacimos',
        'perfilRacimos.numeroDedos',
        'perfilRacimos.DesgloceMermas',
        'perfilRacimos.DesgloceMermas.defecto',
      ],
    });

    const mermaHaciendad = merma.map((merma) => {
      const {
        rCortado,
        rProcesado,
        mermaProcesada,
        mermaCortada,
        pesoFruta,
        rRechazados,
      } = merma;
      const porcentajeContado = (merma.mermaCortada / merma.rCortado) * 100;
      const porcentajeProcesado = (mermaProcesada / rProcesado) * 100;
      const porcentajeAprobechado =
        ((rCortado - mermaCortada) / rCortado) * 100;

      const total = porcentajeAprobechado + porcentajeContado;

      const racimosMerma = Math.round(mermaCortada / pesoFruta);
      const racimosAprobechado = Math.round(
        (rCortado - mermaCortada) / pesoFruta,
      );

      const cantidadCajaProcesada = merma.totalCajas;

      const ranch = merma.ranch instanceof Ranch && merma.ranch;

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

      let dedos = [];

      racimosEvaluados > 0 &&
        merma.perfilRacimos.map((perfil) => {
          const dedosMerma = perfil.DesgloceMermas.map((dedo) => {
            return {
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
        };
        return {
          ...defecto,
          porcentajeMM,
        };
      });

      const porcentajeRacimoRechazado = rRechazados / mermaCortada;
      const mermaSinRacimos = mermaCortada - rRechazados;

      const defectosMermaGeneral = Object.values<any>(aux).map((defecto) => {
        const pesoRechazado = (mermaSinRacimos / 100) * defecto.porcentajeMM;
        const porcentaje = pesoRechazado / mermaCortada;
        const racimos = pesoRechazado / pesoFruta;
        const manos = racimos * merma.nManos;
        const dedos = racimos * promDedos;
        return {
          ...defecto,
          dedos: Math.round(dedos),
          manos: Math.round(manos),
          racimos: Math.round(racimos),
          pesoRechazado: Number(pesoRechazado.toFixed(2)),
          porcentaje,
        };
      });
      const racimosDefectos = rRechazados / pesoFruta;
      const manosDefectos = racimosDefectos * merma.nManos;
      const dedosDefectos = racimosDefectos * promDedos;
      defectosMermaGeneral.unshift({
        defecto: 'Racimos rechazados',
        dedos: Math.round(dedosDefectos),
        manos: Math.round(manosDefectos),
        racimos: Math.round(racimosDefectos),
        pesoRechazado: Number(rRechazados.toFixed(2)),
        porcentaje: porcentajeRacimoRechazado,
      });
      const totalPorcentajeDefectos = defectosMermaGeneral.reduce(
        (a, b) => a + b.porcentaje,
        0,
      );

      return {
        totalPorcentajeDefectos,
        defectosMermaGeneral,
        defectosMerma2,
        defectosMerma,
        defectos: nuevoObjeto,
        evaluacion,
        ranch,
        pesoMerma: merma.mermaCortada.toFixed(2),
        porcentajeContado: Math.round(porcentajeContado),
        porcentajeProcesado: Math.round(porcentajeProcesado),
        porcentajeAprobechado: Math.round(porcentajeAprobechado),
        racimosMerma: Math.round(racimosMerma),
        racimosAprobechado: Math.round(racimosAprobechado),
        racimosCortados: Math.round(rCortado / pesoFruta),
        racimosProcesados: Math.round(rProcesado / pesoFruta),
        racimosRechazados: Math.round(rRechazados / pesoFruta),
        cantidadCajaProcesada: Math.round(cantidadCajaProcesada),
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
        cajaType: merma.cajas,
        date: merma.fecha,
        perfilRacimos: merma.perfil,
      };
    });

    return mermaHaciendad;
  }

  update(id: number, updateMermaDto: UpdateMermaDto) {
    return `This action updates a #${id} merma`;
  }

  remove(id: number) {
    return `This action removes a #${id} merma`;
  }
}
