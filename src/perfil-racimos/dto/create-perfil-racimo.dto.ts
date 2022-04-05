import { IsNumber, IsObject, IsOptional, Validate } from 'class-validator';
import { Merma } from 'src/merma/entities/merma.entity';
import { Calibracion } from 'src/perfiles/peso-mano/entities/calibracion';
import { LongitudDedos } from 'src/perfiles/peso-mano/entities/longitud-dedos';
import { NumeroDedos } from 'src/perfiles/peso-mano/entities/numero-dedos.entity';
import { PesoMano } from 'src/perfiles/peso-mano/entities/peso-mano.entity';

export class CreatePerfilRacimoDto {
  @IsNumber()
  pesoTallo: number;

  @IsNumber()
  nRacimo: number;

  @IsNumber()
  lote: number;

  @IsOptional()
  merma: Merma;

  @Validate(Calibracion)
  calibraciones: Calibracion[];

  @Validate(LongitudDedos)
  longitudDedos: LongitudDedos[];

  @Validate(NumeroDedos)
  numeroDedos: NumeroDedos[];

  @Validate(PesoMano)
  pesoMano: PesoMano[];
}
