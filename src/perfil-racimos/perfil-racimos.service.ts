import * as fs from 'fs';
import { Injectable, StreamableFile } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment';
import { Merma } from 'src/merma/entities/merma.entity';
import { PesoMano } from 'src/perfiles/peso-mano/entities/peso-mano.entity';
import { PesoManoService } from 'src/perfiles/peso-mano/peso-mano.service';
import { Between, Connection, Repository } from 'typeorm';
import { CreatePerfilRacimoDto } from './dto/create-perfil-racimo.dto';
import { UpdatePerfilRacimoDto } from './dto/update-perfil-racimo.dto';
import { PerfilRacimo } from './entities/perfil-racimo.entity';
import { join } from 'path';
import 'moment/locale/es';
import { Color } from 'src/color/entities/color.entity';
moment.locale('es-mx');

@Injectable()
export class PerfilRacimosService {
  constructor(
    @InjectRepository(PerfilRacimo)
    private readonly perfilRacimoRepository: Repository<PerfilRacimo>,
    private connection: Connection,
  ) {}
  async create(createPerfilRacimoDto: CreatePerfilRacimoDto) {
    const merma = await this.connection.getRepository(Merma).findOne({
      where: {
        ranch: createPerfilRacimoDto.ranch,
        fecha: moment().format('YYYY-MM-DD'),
      },
    });

    if (merma === undefined) {
      const data = await this.connection.getRepository(Merma).save({
        ranch: createPerfilRacimoDto.ranch,
        fecha: moment().format('YYYY-MM-DD'),
      });

      const perfilRacimo = await this.perfilRacimoRepository.create({
        ...createPerfilRacimoDto,
        merma: data,
      });

      await this.connection.manager.save(perfilRacimo.numeroDedos);
      await this.connection.manager.save(perfilRacimo.longitudDedos);
      await this.connection.manager.save(perfilRacimo.calibraciones);
      await this.connection.manager.save(perfilRacimo.pesoMano);
      await this.connection.manager.save(perfilRacimo.DesgloceMermas);

      return await this.perfilRacimoRepository.save(perfilRacimo);
    } else {
      const perfilRacimo = await this.perfilRacimoRepository.create({
        ...createPerfilRacimoDto,
        merma: merma,
      });

      await this.connection.manager.save(perfilRacimo.numeroDedos);
      await this.connection.manager.save(perfilRacimo.longitudDedos);
      await this.connection.manager.save(perfilRacimo.calibraciones);
      await this.connection.manager.save(perfilRacimo.pesoMano);
      await this.connection.manager.save(perfilRacimo.DesgloceMermas);

      return await this.perfilRacimoRepository.save(perfilRacimo);
    }
  }

  async CreatePerfilRacimoResagado(
    CreatePerfilRacimoDto: CreatePerfilRacimoDto,
  ) {
    const exist = await this.connection.getRepository(Merma).findOne({
      where: {
        ranch: CreatePerfilRacimoDto.ranch,
        fecha: CreatePerfilRacimoDto.resagados,
      },
    });

    if (exist === undefined) {
      const data = await this.connection.getRepository(Merma).save({
        ranch: CreatePerfilRacimoDto.ranch,
        fecha: CreatePerfilRacimoDto.resagados,
      });

      const perfilRacimo = await this.perfilRacimoRepository.create({
        ...CreatePerfilRacimoDto,
        merma: data,
      });
      await this.connection.manager.save(perfilRacimo.numeroDedos);
      await this.connection.manager.save(perfilRacimo.longitudDedos);
      await this.connection.manager.save(perfilRacimo.calibraciones);
      await this.connection.manager.save(perfilRacimo.pesoMano);
      await this.connection.manager.save(perfilRacimo.DesgloceMermas);

      return await this.perfilRacimoRepository.save(perfilRacimo);
    } else {
      const perfilRacimo = await this.perfilRacimoRepository.create({
        ...CreatePerfilRacimoDto,
        merma: exist,
      });
      await this.connection.manager.save(perfilRacimo.numeroDedos);
      await this.connection.manager.save(perfilRacimo.longitudDedos);
      await this.connection.manager.save(perfilRacimo.calibraciones);
      await this.connection.manager.save(perfilRacimo.pesoMano);
      await this.connection.manager.save(perfilRacimo.DesgloceMermas);

      return await this.perfilRacimoRepository.save(perfilRacimo);
    }
  }

  async findByRanch(ranch: number, fecha: string) {
    const count = await this.perfilRacimoRepository.find({
      where: {
        merma: {
          ranch: ranch,
          fecha: fecha,
        },
      },
      relations: ['merma'],
    });
    console.log(count);
    return count;
  }

  async findByRanchPerfiles(ranch: number, week: number) {
    const weekFind = moment().isoWeek(week).format('YYYY-MM-DD');
    const weekEnd = moment().isoWeek(week).add(6, 'days').format('YYYY-MM-DD');
    const perfiles = await this.perfilRacimoRepository.find({
      where: {
        merma: {
          ranch: ranch,
          fecha: Between(weekFind, weekEnd),
        },
      },
      relations: [
        'merma',
        'numeroDedos',
        'longitudDedos',
        'calibraciones',
        'pesoMano',
      ],
    });
    return perfiles;
  }

  async findAll(res: any, ranch: number, week: number) {
    const weekEnd = moment().isoWeek(week).add(5, 'days').format('YYYY-MM-DD');
    const weekStart = moment()
      .isoWeek(week)
      .subtract(1, 'days')
      .format('YYYY-MM-DD');

    console.log(weekStart, weekEnd);

    const perfilRacimos = await this.perfilRacimoRepository.find({
      order: {
        id: 'DESC',
      },
      where: {
        merma: {
          fecha: Between(weekStart, weekEnd),
          /* ranch: {
            zona: ranch,
          }, */
        },
      },
      relations: [
        'merma',
        'merma.ranch',
        'merma.ranch.zona',
        'pesoMano',
        'numeroDedos',
        'longitudDedos',
        'calibraciones',
      ],
    });

    const orderBynumMano = perfilRacimos.map((perfilRacimo) => {
      return {
        fecha:
          typeof perfilRacimo.merma !== 'number' && perfilRacimo.merma.fecha,
        lote: perfilRacimo.lote,
        edad: perfilRacimo.edad,
        ranch:
          typeof perfilRacimo.merma !== 'number' &&
          typeof perfilRacimo.merma.ranch !== 'number' &&
          perfilRacimo.merma.ranch.nombre,
        zona: (perfilRacimo as any).merma.ranch.zona.nombre,
        pesoMano: perfilRacimo.pesoMano
          .sort((a, b) => {
            return a.numMano - b.numMano;
          })
          .map((pesoMano) => {
            return {
              peso: pesoMano.pesoMano,
            };
          }),
        numeroDedos: perfilRacimo.numeroDedos
          .sort((a, b) => {
            return a.numMano - b.numMano;
          })
          .map((numeroDedos) => {
            return {
              numDedos: numeroDedos.numDedos,
            };
          }),
        longitudDedos: perfilRacimo.longitudDedos
          .sort((a, b) => {
            return a.numMano - b.numMano;
          })
          .map((longitudDedos) => {
            return {
              longitud: longitudDedos.longitudDedos,
            };
          }),
        calibraciones: perfilRacimo.calibraciones
          .sort((a, b) => {
            return a.numMano - b.numMano;
          })
          .map((calibraciones) => {
            return {
              calibracion: calibraciones.calibracion,
            };
          }),
      };
    });

    fs.writeFileSync(
      './src/perfilRacimos.json',
      JSON.stringify(orderBynumMano),
    );

    //limpiar memoria ram
    perfilRacimos.length = 0;
    orderBynumMano.length = 0;

    const file = fs.createReadStream(
      join(process.cwd(), './src/perfilRacimos.json'),
    );
    res.set({
      'Content-Type': 'application/json',
      'Content-Disposition':
        'attachment; filename="zona ' +
        ranch +
        ' perfiles semana ' +
        week +
        '.json"',
    });

    return new StreamableFile(file);
    /* return orderBynumMano;*/
  }

  findOne(id: number) {
    return `This action returns aa #${id} perfilRacimo`;
  }

  update(id: number, updatePerfilRacimoDto: UpdatePerfilRacimoDto) {
    return `This action updates a #${id} perfilRacimo`;
  }

  remove(id: number) {
    return `This action removes a #${id} perfilRacimo`;
  }
}
