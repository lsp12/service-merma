import { Injectable } from '@nestjs/common';
import { CreateTipoDefectoDto } from './dto/create-tipo-defecto.dto';
import { UpdateTipoDefectoDto } from './dto/update-tipo-defecto.dto';

@Injectable()
export class TipoDefectoService {
  create(createTipoDefectoDto: CreateTipoDefectoDto) {
    return 'This action adds a new tipoDefecto';
  }

  findAll() {
    return `This action returns all tipoDefecto`;
  }

  findOne(id: number) {
    return `This action returns a #${id} tipoDefecto`;
  }

  update(id: number, updateTipoDefectoDto: UpdateTipoDefectoDto) {
    return `This action updates a #${id} tipoDefecto`;
  }

  remove(id: number) {
    return `This action removes a #${id} tipoDefecto`;
  }
}
