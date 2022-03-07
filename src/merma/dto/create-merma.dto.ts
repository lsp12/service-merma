import { IsNumber, IsOptional } from 'class-validator';

export class CreateMermaDto {
  @IsNumber()
  rCortado: number;

  @IsNumber()
  rProcesado: number;

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
}

export interface ICajas {
  marca: string;
  peso: number;
  cantidad: number;
}
