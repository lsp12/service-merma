import { IsNumber } from 'class-validator';
import { Sku } from 'src/sku/entities/sku.entity';

export class CreateCajaDto {
  @IsNumber()
  cantidad: number;

  @IsNumber()
  cantidadR: number;

  @IsNumber()
  sku: Sku;

  @IsNumber()
  merma: number;
}
