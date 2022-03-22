import { Injectable } from '@nestjs/common';
import { CreateDefectoDto } from './dto/create-defecto.dto';
import { UpdateDefectoDto } from './dto/update-defecto.dto';

@Injectable()
export class DefectosService {
  create(createDefectoDto: CreateDefectoDto) {
    return 'This action adds a new defecto';
  }

  findAll() {
    return `This action returns all defectos`;
  }

  findOne(id: number) {
    return `This action returns a #${id} defecto`;
  }

  update(id: number, updateDefectoDto: UpdateDefectoDto) {
    return `This action updates a #${id} defecto`;
  }

  remove(id: number) {
    return `This action removes a #${id} defecto`;
  }
}
