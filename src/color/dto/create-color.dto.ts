import { IsNumber, IsString } from 'class-validator';

export class CreateColorDto {
  @IsString()
  color: string;

  @IsNumber()
  semana: number;
}
