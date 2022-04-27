import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateColorDto } from './dto/create-color.dto';
import { UpdateColorDto } from './dto/update-color.dto';
import { Color } from './entities/color.entity';
import * as moment from 'moment';
import 'moment/locale/es';
moment.locale('es-mx');
@Injectable()
export class ColorService {
  constructor(
    @InjectRepository(Color)
    private readonly colorRepository: Repository<Color>,
  ) {}
  async create(createColorDto: CreateColorDto) {
    const exist = await this.colorRepository.findOne({
      where: {
        nombre: createColorDto.color,
      },
    });
    if (exist) {
      throw new Error('Ya existe un color con ese nombre');
    }
    const color = await this.colorRepository.create(createColorDto);
    return await this.colorRepository.save(color);
  }

  async findAll() {
    return await this.colorRepository.find();
  }

  async findWeek() {
    let newColor = [];
    const week = Number(moment().format('w'));

    const color = await this.colorRepository.find({ order: { semana: 'ASC' } });
    do {
      newColor = newColor.concat(color);
    } while (newColor.length + 1 <= 53);

    const colorByWeek = [13, 12, 11, 10, 9].map((range) => {
      const date = Number(
        moment()
          .week(week - range)
          .format('w'),
      );
      return {
        color: newColor[date - 1],
        week: date,
        age: range,
      };
    });
    return {
      week,
      colorByWeek,
    };
  }

  findOne(id: number) {
    return `This action returns a #${id} color`;
  }

  async update(id: number, updateColorDto: UpdateColorDto) {
    const color = await this.colorRepository.findOne(id);
    if (!color) throw new Error('No existe un color con ese ID');
    const colorCreate = this.colorRepository.create(updateColorDto);
    await this.colorRepository.update(id, colorCreate);
    return updateColorDto;
  }

  async remove(id: number) {
    const color = await this.colorRepository.findOne(id);
    if (!color) throw new Error('No existe un color con ese ID');
    await this.colorRepository.delete(id);
    return 'Color eliminado';
  }
}
