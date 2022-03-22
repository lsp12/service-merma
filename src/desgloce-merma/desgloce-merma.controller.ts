import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { DesgloceMermaService } from './desgloce-merma.service';
import { CreateDesgloceMermaDto } from './dto/create-desgloce-merma.dto';
import { UpdateDesgloceMermaDto } from './dto/update-desgloce-merma.dto';

@Controller('desgloce-merma')
export class DesgloceMermaController {
  constructor(private readonly desgloceMermaService: DesgloceMermaService) {}

  @Post()
  create(@Body() createDesgloceMermaDto: CreateDesgloceMermaDto) {
    return this.desgloceMermaService.create(createDesgloceMermaDto);
  }

  @Get()
  findAll() {
    return this.desgloceMermaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.desgloceMermaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDesgloceMermaDto: UpdateDesgloceMermaDto) {
    return this.desgloceMermaService.update(+id, updateDesgloceMermaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.desgloceMermaService.remove(+id);
  }
}
