import { Injectable } from '@nestjs/common';
import { CreatePerfilRacimoDto } from './dto/create-perfil-racimo.dto';
import { UpdatePerfilRacimoDto } from './dto/update-perfil-racimo.dto';

@Injectable()
export class PerfilRacimosService {
  create(createPerfilRacimoDto: CreatePerfilRacimoDto) {
    return 'This action adds a new perfilRacimo';
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
