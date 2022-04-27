import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { RejectedBunchesService } from './rejected-bunches.service';
import { CreateRejectedBunchDto } from './dto/create-rejected-bunch.dto';
import { UpdateRejectedBunchDto } from './dto/update-rejected-bunch.dto';

@Controller('rejected-bunches')
export class RejectedBunchesController {
  constructor(private readonly rejectedBunchesService: RejectedBunchesService) {}

  @Post()
  create(@Body() createRejectedBunchDto: CreateRejectedBunchDto) {
    return this.rejectedBunchesService.create(createRejectedBunchDto);
  }

  @Get()
  findAll() {
    return this.rejectedBunchesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.rejectedBunchesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRejectedBunchDto: UpdateRejectedBunchDto) {
    return this.rejectedBunchesService.update(+id, updateRejectedBunchDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.rejectedBunchesService.remove(+id);
  }
}
