import { IsNumber, IsString } from 'class-validator';

export class CreateSkuDto {
  @IsString()
  marca: string;

  @IsNumber()
  peso: number;
}
