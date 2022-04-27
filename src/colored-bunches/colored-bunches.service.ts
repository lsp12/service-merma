import { Injectable } from '@nestjs/common';
import { CreateColoredBunchDto } from './dto/create-colored-bunch.dto';
import { UpdateColoredBunchDto } from './dto/update-colored-bunch.dto';

@Injectable()
export class ColoredBunchesService {
  create(createColoredBunchDto: CreateColoredBunchDto) {
    return 'This action adds a new coloredBunch';
  }

  findAll() {
    return `This action returns all coloredBunches`;
  }

  findOne(id: number) {
    return `This action returns a #${id} coloredBunch`;
  }

  update(id: number, updateColoredBunchDto: UpdateColoredBunchDto) {
    return `This action updates a #${id} coloredBunch`;
  }

  remove(id: number) {
    return `This action removes a #${id} coloredBunch`;
  }
}
