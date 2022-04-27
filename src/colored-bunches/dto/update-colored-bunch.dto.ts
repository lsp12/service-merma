import { PartialType } from '@nestjs/mapped-types';
import { CreateColoredBunchDto } from './create-colored-bunch.dto';

export class UpdateColoredBunchDto extends PartialType(CreateColoredBunchDto) {}
