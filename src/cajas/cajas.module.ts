import { Module } from '@nestjs/common';
import { CajasService } from './cajas.service';
import { CajasController } from './cajas.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Caja } from './entities/caja.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Caja])],
  controllers: [CajasController],
  providers: [CajasService],
  exports: [CajasService],
})
export class CajasModule {}
