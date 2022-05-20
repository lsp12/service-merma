import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment';
import { Merma } from 'src/merma/entities/merma.entity';
import { PesoMano } from 'src/perfiles/peso-mano/entities/peso-mano.entity';
import { PesoManoService } from 'src/perfiles/peso-mano/peso-mano.service';
import { Between, Connection, Repository } from 'typeorm';
import { CreatePerfilRacimoDto } from './dto/create-perfil-racimo.dto';
import { UpdatePerfilRacimoDto } from './dto/update-perfil-racimo.dto';
import { PerfilRacimo } from './entities/perfil-racimo.entity';

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

  findAll() {
    return `This action returns all perfilRacimos`;
  }

  findOne(id: number) {
    return `This action returns a #${id} perfilRacimo`;
  }

  update(id: number, updatePerfilRacimoDto: UpdatePerfilRacimoDto) {
    return `This action updates a #${id} perfilRacimo`;
  }

  remove(id: number) {
    return `This action removes a #${id} perfilRacimo`;
  }
}
