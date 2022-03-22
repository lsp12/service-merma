import { Injectable } from '@nestjs/common';
import { CreateDesgloceMermaDto } from './dto/create-desgloce-merma.dto';
import { UpdateDesgloceMermaDto } from './dto/update-desgloce-merma.dto';

@Injectable()
export class DesgloceMermaService {
  create(createDesgloceMermaDto: CreateDesgloceMermaDto) {
    return 'This action adds a new desgloceMerma';
  }

  findAll() {
    return `This action returns all desgloceMerma`;
  }

  findOne(id: number) {
    return `This action returns a #${id} desgloceMerma`;
  }

  update(id: number, updateDesgloceMermaDto: UpdateDesgloceMermaDto) {
    return `This action updates a #${id} desgloceMerma`;
  }

  remove(id: number) {
    return `This action removes a #${id} desgloceMerma`;
  }
}
