import { Injectable } from '@nestjs/common';
import { CreateDesgloceManoDto } from './dto/create-desgloce-mano.dto';
import { UpdateDesgloceManoDto } from './dto/update-desgloce-mano.dto';

@Injectable()
export class DesgloceManosService {
  create(createDesgloceManoDto: CreateDesgloceManoDto) {
    return 'This action adds a new desgloceMano';
  }

  findAll() {
    return `This action returns all desgloceManos`;
  }

  findOne(id: number) {
    return `This action returns a #${id} desgloceMano`;
  }

  update(id: number, updateDesgloceManoDto: UpdateDesgloceManoDto) {
    return `This action updates a #${id} desgloceMano`;
  }

  remove(id: number) {
    return `This action removes a #${id} desgloceMano`;
  }
}
