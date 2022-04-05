import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreatePesoManoDto } from './dto/create-peso-mano.dto';
import { UpdatePesoManoDto } from './dto/update-peso-mano.dto';
import { Calibracion } from './entities/calibracion';
import { LongitudDedos } from './entities/longitud-dedos';
import { NumeroDedos } from './entities/numero-dedos.entity';
import { PesoMano } from './entities/peso-mano.entity';

@Injectable()
export class PesoManoService {
  constructor(
    @InjectRepository(PesoMano)
    private readonly pesoManoRepository: Repository<PesoMano>,
    @InjectRepository(Calibracion)
    private readonly CalibracionRepository: Repository<Calibracion>,
    @InjectRepository(NumeroDedos)
    private readonly NumeroDedosRepository: Repository<NumeroDedos>,
    @InjectRepository(LongitudDedos)
    private readonly LongitudDedosRepository: Repository<LongitudDedos>,
  ) {}
  create(createPesoManoDto: CreatePesoManoDto) {
    console.log(createPesoManoDto);
    return 'This action adds a new pesoMano';
  }

  async createPerfilRacimo(pesoMano: PesoMano[]) {
    const perfilRacimo = await this.pesoManoRepository.create(pesoMano);

    return await this.pesoManoRepository.save(perfilRacimo);
  }

  findAll() {
    return `This action returns all pesoMano`;
  }

  findOne(id: number) {
    return `This action returns a #${id} pesoMano`;
  }

  update(id: number, updatePesoManoDto: UpdatePesoManoDto) {
    return `This action updates a #${id} pesoMano`;
  }

  remove(id: number) {
    return `This action removes a #${id} pesoMano`;
  }
}
