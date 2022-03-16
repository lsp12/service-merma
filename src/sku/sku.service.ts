import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateSkuDto } from './dto/create-sku.dto';
import { UpdateSkuDto } from './dto/update-sku.dto';
import { Sku } from './entities/sku.entity';

@Injectable()
export class SkuService {
  constructor(
    @InjectRepository(Sku)
    private skuRepository: Repository<Sku>,
  ) {}

  async create(createSkuDto: CreateSkuDto) {
    const exist = await this.skuRepository.findOne({
      where: {
        marca: createSkuDto.marca,
      },
    });
    if (exist) throw new ConflictException('Ya existe un SKU con esa marca');
    const sku = await this.skuRepository.create(createSkuDto);
    await this.skuRepository.save(sku);
    return sku;
  }

  async findAll() {
    return await this.skuRepository.find();
  }

  findOne(id: number) {
    return `This action returns a #${id} sku`;
  }

  async update(id: number, updateSkuDto: UpdateSkuDto) {
    const sku = await this.skuRepository.findOne(id);
    if (!sku) throw new NotFoundException('No existe un SKU con ese ID');
    await this.skuRepository.update(id, updateSkuDto);
    return updateSkuDto;
  }

  async remove(id: number) {
    const sku = await this.skuRepository.findOne(id);
    if (!sku) throw new NotFoundException('No existe un SKU con ese ID');
    await this.skuRepository.remove(sku);
    return sku;
  }
}
