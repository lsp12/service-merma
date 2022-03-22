import { Module } from '@nestjs/common';
import { DefectosService } from './defectos.service';
import { DefectosController } from './defectos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Defecto } from './entities/defecto.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Defecto])],
  controllers: [DefectosController],
  providers: [DefectosService],
})
export class DefectosModule {}
