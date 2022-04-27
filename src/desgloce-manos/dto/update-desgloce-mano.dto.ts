import { PartialType } from '@nestjs/mapped-types';
import { CreateDesgloceManoDto } from './create-desgloce-mano.dto';

export class UpdateDesgloceManoDto extends PartialType(CreateDesgloceManoDto) {}
