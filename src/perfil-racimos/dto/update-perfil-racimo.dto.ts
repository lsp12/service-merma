import { PartialType } from '@nestjs/mapped-types';
import { CreatePerfilRacimoDto } from './create-perfil-racimo.dto';

export class UpdatePerfilRacimoDto extends PartialType(CreatePerfilRacimoDto) {}
