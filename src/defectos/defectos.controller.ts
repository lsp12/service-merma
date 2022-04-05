import {
  Controller,
  Get,
  Post,
  Body,
  Put,
  Param,
  Delete,
} from '@nestjs/common';
import { DefectosService } from './defectos.service';
import { CreateDefectoDto } from './dto/create-defecto.dto';
import { UpdateDefectoDto } from './dto/update-defecto.dto';

@Controller('defectos')
export class DefectosController {
  constructor(private readonly defectosService: DefectosService) {}

  @Post()
  create(@Body() createDefectoDto: CreateDefectoDto) {
    return this.defectosService.create(createDefectoDto);
  }

  @Get()
  findAll() {
    return this.defectosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.defectosService.findOne(+id);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateDefectoDto: UpdateDefectoDto) {
    return this.defectosService.update(+id, updateDefectoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.defectosService.remove(+id);
  }
}
