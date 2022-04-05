import { IsOptional, IsString } from 'class-validator';
import { TipoDefecto } from 'src/tipo-defecto/entities/tipo-defecto.entity';

export class CreateDefectoDto {
  @IsString()
  nombre: string;

  @IsOptional()
  tipoDefecto: TipoDefecto;

  @IsString()
  siglas: string;
}
