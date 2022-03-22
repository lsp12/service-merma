import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { TipoDefectoService } from './tipo-defecto.service';
import { CreateTipoDefectoDto } from './dto/create-tipo-defecto.dto';
import { UpdateTipoDefectoDto } from './dto/update-tipo-defecto.dto';

@Controller('tipo-defecto')
export class TipoDefectoController {
  constructor(private readonly tipoDefectoService: TipoDefectoService) {}

  @Post()
  create(@Body() createTipoDefectoDto: CreateTipoDefectoDto) {
    return this.tipoDefectoService.create(createTipoDefectoDto);
  }

  @Get()
  findAll() {
    return this.tipoDefectoService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.tipoDefectoService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTipoDefectoDto: UpdateTipoDefectoDto) {
    return this.tipoDefectoService.update(+id, updateTipoDefectoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.tipoDefectoService.remove(+id);
  }
}
