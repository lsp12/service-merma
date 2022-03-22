import { PartialType } from '@nestjs/mapped-types';
import { CreateDesgloceMermaDto } from './create-desgloce-merma.dto';

export class UpdateDesgloceMermaDto extends PartialType(CreateDesgloceMermaDto) {}
