import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCajaDto } from './dto/create-caja.dto';
import { UpdateCajaDto } from './dto/update-caja.dto';
import { Caja } from './entities/caja.entity';

@Injectable()
export class CajasService {
  constructor(
    @InjectRepository(Caja)
    private cajaRepository: Repository<Caja>,
  ) {}

  async create(createCajaDto: CreateCajaDto[]) {
    const caja = await this.cajaRepository.create(createCajaDto);
    const save = await this.cajaRepository.save(caja);
    console.log(save);
  }

  async findByMerma(id: number) {
    const cajas = await this.cajaRepository.find({
      where: { merma: id },
      relations: ['sku'],
    });
    return cajas;
  }

  findAll() {
    return `This action returns all cajas`;
  }

  findOne(id: number) {
    return `This action returns a #${id} caja`;
  }

  update(id: number, updateCajaDto: UpdateCajaDto) {
    return `This action updates a #${id} caja`;
  }

  remove(id: number) {
    return `This action removes a #${id} caja`;
  }
}
