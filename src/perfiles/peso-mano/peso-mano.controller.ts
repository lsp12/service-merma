import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PesoManoService } from './peso-mano.service';
import { CreatePesoManoDto } from './dto/create-peso-mano.dto';
import { UpdatePesoManoDto } from './dto/update-peso-mano.dto';

@Controller('peso-mano')
export class PesoManoController {
  constructor(private readonly pesoManoService: PesoManoService) {}

  @Post()
  create(@Body() createPesoManoDto: CreatePesoManoDto) {
    return this.pesoManoService.create(createPesoManoDto);
  }

  @Get()
  findAll() {
    return this.pesoManoService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.pesoManoService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePesoManoDto: UpdatePesoManoDto) {
    return this.pesoManoService.update(+id, updatePesoManoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.pesoManoService.remove(+id);
  }
}
