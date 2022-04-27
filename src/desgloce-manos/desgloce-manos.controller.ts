import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { DesgloceManosService } from './desgloce-manos.service';
import { CreateDesgloceManoDto } from './dto/create-desgloce-mano.dto';
import { UpdateDesgloceManoDto } from './dto/update-desgloce-mano.dto';

@Controller('desgloce-manos')
export class DesgloceManosController {
  constructor(private readonly desgloceManosService: DesgloceManosService) {}

  @Post()
  create(@Body() createDesgloceManoDto: CreateDesgloceManoDto) {
    return this.desgloceManosService.create(createDesgloceManoDto);
  }

  @Get()
  findAll() {
    return this.desgloceManosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.desgloceManosService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDesgloceManoDto: UpdateDesgloceManoDto) {
    return this.desgloceManosService.update(+id, updateDesgloceManoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.desgloceManosService.remove(+id);
  }
}
