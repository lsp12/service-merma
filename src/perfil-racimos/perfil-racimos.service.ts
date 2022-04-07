import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PesoMano } from 'src/perfiles/peso-mano/entities/peso-mano.entity';
import { PesoManoService } from 'src/perfiles/peso-mano/peso-mano.service';
import { Connection, Repository } from 'typeorm';
import { CreatePerfilRacimoDto } from './dto/create-perfil-racimo.dto';
import { UpdatePerfilRacimoDto } from './dto/update-perfil-racimo.dto';
import { PerfilRacimo } from './entities/perfil-racimo.entity';

@Injectable()
export class PerfilRacimosService {
  constructor(
    @InjectRepository(PerfilRacimo)
    private readonly perfilRacimoRepository: Repository<PerfilRacimo>,
    private pesoManoService: PesoManoService,
    private connection: Connection,
  ) {}
  async create(createPerfilRacimoDto: CreatePerfilRacimoDto) {
    const perfilRacimo = await this.perfilRacimoRepository.create(
      createPerfilRacimoDto,
    );

    await this.connection.manager.save(perfilRacimo.numeroDedos);
    await this.connection.manager.save(perfilRacimo.longitudDedos);
    await this.connection.manager.save(perfilRacimo.calibraciones);
    await this.connection.manager.save(perfilRacimo.pesoMano);
    await this.connection.manager.save(perfilRacimo.DesgloceMermas);

    return await this.perfilRacimoRepository.save(perfilRacimo);
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
