import { IsNumber, IsOptional } from 'class-validator';
import { Caja } from 'src/cajas/entities/caja.entity';
import { Color } from 'src/color/entities/color.entity';
import { ColoredBunch } from 'src/colored-bunches/entities/colored-bunch.entity';
import { DesgloceMano } from 'src/desgloce-manos/entities/desgloce-mano.entity';
import { RejectedBunch } from 'src/rejected-bunches/entities/rejected-bunch.entity';
import { Sku } from 'src/sku/entities/sku.entity';

export class CreateMermaDto {
  @IsNumber()
  ranch: number;

  @IsNumber()
  rCortado: number;

  @IsNumber()
  rProcesado: number;

  @IsOptional()
  cajas: Caja[];

  @IsOptional()
  cajaR: ICajas[];

  @IsNumber()
  pesoFruta: number;

  @IsNumber()
  pesoRacimo: number;

  @IsNumber()
  pesoTallo: number;

  @IsNumber()
  edad: number;

  @IsNumber()
  calibracion: number;

  @IsNumber()
  nManos: number;

  @IsNumber()
  @IsOptional()
  pesoSegundaMano: number;

  @IsNumber()
  @IsOptional()
  pesoUltimaMano: number;

  @IsNumber()
  lDedoSegunda: number;

  @IsNumber()
  @IsOptional()
  lDedoUltima: number;

  @IsNumber()
  @IsOptional()
  numManosVotadasP: number;

  @IsNumber()
  @IsOptional()
  numManosVotadasU: number;

  @IsNumber()
  @IsOptional()
  CantidadCJ: number;

  @IsOptional()
  skuCajas: Caja[];

  @IsOptional()
  fecha: string;

  @IsOptional()
  color: Color;

  @IsOptional()
  coloredBunches: ColoredBunch[];

  @IsOptional()
  rejectedBunches: RejectedBunch[];

  @IsOptional()
  resagados: any;

  @IsOptional()
  DesgloceManos: DesgloceMano[];
}

export interface ICajas {
  cantidad: number;
}

export interface ISkuCajas {
  sku: Sku;
  cantidad: ICajas;
  cantidadR: ICajas;
}
