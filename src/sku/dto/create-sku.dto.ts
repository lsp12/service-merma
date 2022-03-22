import { IsNumber, IsString } from 'class-validator';

export class CreateSkuDto {
  @IsString()
  marca: string;

  @IsNumber()
  peso: number;

  @IsNumber()
  clusters: number;

  @IsNumber()
  dedosMin: number;

  @IsNumber()
  dedosMax: number;

  @IsNumber()
  pesoFrutaFundaMin: number;

  @IsNumber()
  pesoFrutaFundaMax: number;

  @IsNumber()
  calibracionMin: number;

  @IsNumber()
  calibracionMax: number;

  @IsNumber()
  largoDedoMin: number;

  @IsNumber()
  largoDedoMax: number;

  @IsString()
  empresa: string;
}
