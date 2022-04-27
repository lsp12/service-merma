import { IsNumber, IsOptional, Validate } from 'class-validator';
import { DesgloceMerma } from 'src/desgloce-merma/entities/desgloce-merma.entity';
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

  @IsOptional()
  @Validate(Calibracion)
  calibraciones: Calibracion[];

  @IsOptional()
  @Validate(LongitudDedos)
  longitudDedos: LongitudDedos[];

  @IsOptional()
  @Validate(NumeroDedos)
  numeroDedos: NumeroDedos[];

  @IsOptional()
  @Validate(PesoMano)
  pesoMano: PesoMano[];

  @IsOptional()
  @Validate(DesgloceMerma)
  DesgloceMermas: DesgloceMerma[];
}
