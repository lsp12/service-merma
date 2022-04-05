import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateDefectoDto } from './dto/create-defecto.dto';
import { UpdateDefectoDto } from './dto/update-defecto.dto';
import { Defecto } from './entities/defecto.entity';

@Injectable()
export class DefectosService {
  constructor(
    @InjectRepository(Defecto)
    private readonly defectoRepository: Repository<Defecto>,
  ) {}
  async create(createDefectoDto: CreateDefectoDto) {
    const defecto = await this.defectoRepository.create(createDefectoDto);
    return await this.defectoRepository.save(defecto);
  }

  async findAll() {
    return await this.defectoRepository.find({
      relations: ['tipoDefecto'],
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} defecto`;
  }

  async update(id: number, updateDefectoDto: UpdateDefectoDto) {
    const defecto = await this.defectoRepository.findOne(id);
    if (!defecto)
      throw new NotFoundException('No existe un defecto con ese ID');
    const defectoCreate = this.defectoRepository.create(updateDefectoDto);
    await this.defectoRepository.update(id, defectoCreate);
    return updateDefectoDto;
  }

  async remove(id: number) {
    const defecto = await this.defectoRepository.findOne(id);
    if (!defecto)
      throw new NotFoundException('No existe un defecto con ese ID');
    await this.defectoRepository.remove(defecto);
    return defecto;
  }
}
