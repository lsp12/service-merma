import { Injectable } from '@nestjs/common';
import { CreatePesoManoDto } from './dto/create-peso-mano.dto';
import { UpdatePesoManoDto } from './dto/update-peso-mano.dto';

@Injectable()
export class PesoManoService {
  create(createPesoManoDto: CreatePesoManoDto) {
    return 'This action adds a new pesoMano';
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
