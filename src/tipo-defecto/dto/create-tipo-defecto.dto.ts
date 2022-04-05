import { IsString } from 'class-validator';

export class CreateTipoDefectoDto {
  @IsString()
  nombre: string;
}
