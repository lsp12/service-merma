import { PartialType } from '@nestjs/mapped-types';
import { CreateRejectedBunchDto } from './create-rejected-bunch.dto';

export class UpdateRejectedBunchDto extends PartialType(CreateRejectedBunchDto) {}
