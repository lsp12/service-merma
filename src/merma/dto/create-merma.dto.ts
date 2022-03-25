import { IsNumber, IsOptional } from 'class-validator';
import { Sku } from 'src/sku/entities/sku.entity';

export class CreateMermaDto {
  @IsNumber()
  ranch: number;

  @IsNumber()
  rCortado: number;

  @IsNumber()
  rProcesado: number;

  @IsOptional()
  cajas: ICajas[];

  @IsOptional()
  cajaR: ICajas[];

  @IsNumber()
  pesoFruta: number;

  @IsNumber()
  pesoRacimo: number;

  @IsNumber()
  pesotallo: number;

  @IsNumber()
  edad: number;

  @IsNumber()
  calibracion: number;

  @IsNumber()
  nManos: number;

  @IsNumber()
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
  skuCajas: ISkuCajas[];

  @IsOptional()
  fecha: string;
}

export interface ICajas {
  cantidad: number;
}

export interface ISkuCajas {
  sku: Sku;
  caja: ICajas;
  cajaR: ICajas;
}
