import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ColoredBunchesService } from './colored-bunches.service';
import { CreateColoredBunchDto } from './dto/create-colored-bunch.dto';
import { UpdateColoredBunchDto } from './dto/update-colored-bunch.dto';

@Controller('colored-bunches')
export class ColoredBunchesController {
  constructor(private readonly coloredBunchesService: ColoredBunchesService) {}

  @Post()
  create(@Body() createColoredBunchDto: CreateColoredBunchDto) {
    return this.coloredBunchesService.create(createColoredBunchDto);
  }

  @Get()
  findAll() {
    return this.coloredBunchesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.coloredBunchesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateColoredBunchDto: UpdateColoredBunchDto,
  ) {
    return this.coloredBunchesService.update(+id, updateColoredBunchDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.coloredBunchesService.remove(+id);
  }
}
