import { Module } from '@nestjs/common';
import { PesoManoService } from './peso-mano.service';
import { PesoManoController } from './peso-mano.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PesoMano } from './entities/peso-mano.entity';
import { Calibracion } from './entities/calibracion';
import { NumeroDedos } from './entities/numero-dedos.entity';
import { LongitudDedos } from './entities/longitud-dedos';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      PesoMano,
      Calibracion,
      NumeroDedos,
      LongitudDedos,
    ]),
  ],
  controllers: [PesoManoController],
  providers: [PesoManoService],
})
export class PesoManoModule {}
