import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateTipoDefectoDto } from './dto/create-tipo-defecto.dto';
import { UpdateTipoDefectoDto } from './dto/update-tipo-defecto.dto';
import { TipoDefecto } from './entities/tipo-defecto.entity';

@Injectable()
export class TipoDefectoService {
  constructor(
    @InjectRepository(TipoDefecto)
    private readonly tipoDefectoRepository: Repository<TipoDefecto>,
  ) {}

  async create(createTipoDefectoDto: CreateTipoDefectoDto) {
    const exist = await this.tipoDefectoRepository.findOne({
      where: { nombre: createTipoDefectoDto.nombre },
    });
    if (exist) {
      throw new Error('Ya existe un tipo de defecto con ese nombre');
    }
    const tipoDefecto = await this.tipoDefectoRepository.create(
      createTipoDefectoDto,
    );
    return await this.tipoDefectoRepository.save(tipoDefecto);
  }

  async findAll() {
    return await this.tipoDefectoRepository.find();
  }

  findOne(id: number) {
    return `This action returns a #${id} tipoDefecto`;
  }

  async update(id: number, updateTipoDefectoDto: UpdateTipoDefectoDto) {
    const tipoDefecto = await this.tipoDefectoRepository.findOne(id);
    if (!tipoDefecto)
      throw new Error('No existe un tipo de defecto con ese ID');
    const tipoDefectoCreate =
      this.tipoDefectoRepository.create(updateTipoDefectoDto);
    await this.tipoDefectoRepository.update(id, tipoDefectoCreate);
    return updateTipoDefectoDto;
  }

  async remove(id: number) {
    const tipoDefecto = await this.tipoDefectoRepository.findOne(id);
    if (!tipoDefecto)
      throw new Error('No existe un tipo de defecto con ese ID');
    await this.tipoDefectoRepository.delete(id);
    return 'Tipo de defecto eliminado';
  }
}
