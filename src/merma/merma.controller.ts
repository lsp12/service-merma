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

@Controller('merma')
export class MermaController {
  constructor(private readonly mermaService: MermaService) {}

  @Post()
  create(@Body() createMermaDto: CreateMermaDto) {
    console.log(createMermaDto);
    return this.mermaService.create(createMermaDto);
  }

  @Get()
  findAll() {
    return this.mermaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.mermaService.findOne(+id);
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
