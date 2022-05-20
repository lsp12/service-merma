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

  @Post('/CreatePerfilRacimoResagado')
  CreatePerfilRacimoResagado(
    @Body() CreatePerfilRacimoDto: CreatePerfilRacimoDto,
  ) {
    return this.perfilRacimosService.CreatePerfilRacimoResagado(
      CreatePerfilRacimoDto,
    );
  }

  @Get()
  findAll() {
    return this.perfilRacimosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.perfilRacimosService.findOne(+id);
  }

  @Get('count/:ranch/:fecha')
  findByRanchandDate(
    @Param('ranch') ranch: string,
    @Param('fecha') fecha: string,
  ) {
    return this.perfilRacimosService.findByRanch(+ranch, fecha);
  }

  @Get('/findByRanchPerfiles/:ranch/:week')
  findByRanchPerfiles(
    @Param('ranch') ranch: string,
    @Param('week') week: string,
  ) {
    return this.perfilRacimosService.findByRanchPerfiles(+ranch, +week);
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
