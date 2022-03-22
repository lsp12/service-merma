import { Module } from '@nestjs/common';
import { TipoDefectoService } from './tipo-defecto.service';
import { TipoDefectoController } from './tipo-defecto.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TipoDefecto } from './entities/tipo-defecto.entity';

@Module({
  imports: [TypeOrmModule.forFeature([TipoDefecto])],
  controllers: [TipoDefectoController],
  providers: [TipoDefectoService],
})
export class TipoDefectoModule {}
