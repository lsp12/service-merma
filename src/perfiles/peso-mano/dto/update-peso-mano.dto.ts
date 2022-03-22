import { PartialType } from '@nestjs/mapped-types';
import { CreatePesoManoDto } from './create-peso-mano.dto';

export class UpdatePesoManoDto extends PartialType(CreatePesoManoDto) {}
