import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PerfilRacimosService } from './perfil-racimos.service';
import { CreatePerfilRacimoDto } from './dto/create-perfil-racimo.dto';
import { UpdatePerfilRacimoDto } from './dto/update-perfil-racimo.dto';

@Controller('perfil-racimos')
export class PerfilRacimosController {
  constructor(private readonly perfilRacimosService: PerfilRacimosService) {}

  @Post()
  create(@Body() createPerfilRacimoDto: CreatePerfilRacimoDto) {
    return this.perfilRacimosService.create(createPerfilRacimoDto);
  }

  @Get()
  findAll() {
    return this.perfilRacimosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.perfilRacimosService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updatePerfilRacimoDto: UpdatePerfilRacimoDto,
  ) {
    return this.perfilRacimosService.update(+id, updatePerfilRacimoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.perfilRacimosService.remove(+id);
  }
}
