import { Ranch } from '../entities/ranch.entity';
import { Zona } from '../entities/zona.entity';

export interface IFindMerma {
  ranch: Ranch;
  createdAt: string;
  fechaInicio: string;
  fechaFin: string;
  zona?: Zona;
}
