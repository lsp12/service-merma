import { Injectable } from '@nestjs/common';
import { CreateRejectedBunchDto } from './dto/create-rejected-bunch.dto';
import { UpdateRejectedBunchDto } from './dto/update-rejected-bunch.dto';

@Injectable()
export class RejectedBunchesService {
  create(createRejectedBunchDto: CreateRejectedBunchDto) {
    return 'This action adds a new rejectedBunch';
  }

  findAll() {
    return `This action returns all rejectedBunches`;
  }

  findOne(id: number) {
    return `This action returns a #${id} rejectedBunch`;
  }

  update(id: number, updateRejectedBunchDto: UpdateRejectedBunchDto) {
    return `This action updates a #${id} rejectedBunch`;
  }

  remove(id: number) {
    return `This action removes a #${id} rejectedBunch`;
  }
}
