import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MermaService } from './merma.service';
import { CreateMermaDto } from './dto/create-merma.dto';
import { UpdateMermaDto } from './dto/update-merma.dto';
import { IFindMerma } from './Interface/InterfaceMerma';

@Controller('merma')
export class MermaController {
  constructor(private readonly mermaService: MermaService) {}

  @Post()
  create(@Body() createMermaDto: CreateMermaDto) {
    return this.mermaService.create(createMermaDto);
  }

  @Post('/findMerma')
  findOne(@Body() findMermaDto: IFindMerma) {
    return this.mermaService.findOne(findMermaDto);
  }

  @Get()
  findAll() {
    return this.mermaService.findAll();
  }

  @Get('findByRanch/:id')
  findByRanch(@Param('id') id: string) {
    return this.mermaService.findByRanch(+id);
  }

  @Get('/findByDate/:fecha')
  findByDate(@Param('fecha') fecha: string) {
    return this.mermaService.findByDate(fecha);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMermaDto: UpdateMermaDto) {
    return this.mermaService.update(+id, updateMermaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.mermaService.remove(+id);
  }
}
