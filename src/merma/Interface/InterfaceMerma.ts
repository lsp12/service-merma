import { Ranch } from '../entities/ranch.entity';

export interface IFindMerma {
  ranch: Ranch;
  createdAt: string;
  fechaInicio: string;
  fechaFin: string;
}
