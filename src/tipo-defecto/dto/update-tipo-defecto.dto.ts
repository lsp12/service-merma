import { PartialType } from '@nestjs/mapped-types';
import { CreateTipoDefectoDto } from './create-tipo-defecto.dto';

export class UpdateTipoDefectoDto extends PartialType(CreateTipoDefectoDto) {}
