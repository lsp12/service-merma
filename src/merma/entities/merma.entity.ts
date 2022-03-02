import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

import { Cajas } from './cajas.entity';
import { Ranch } from './ranch.entity';

@Entity()
export class Merma {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  rCortado: number;

  @Column()
  rProcesado: number;

  @Column()
  rRechazados: number;

  @Column()
  pesoFruta: number;

  @Column()
  pesoRacimo: number;

  @Column()
  pesoTallo: number;

  @Column()
  edad: number;

  @Column()
  calibracion: number;

  @Column()
  nManos: number;

  @Column()
  pesoSegundaMano: number;

  @Column()
  pesoUltimaMano: number;

  @Column()
  lDedoSegunda: number;

  @Column()
  lDedoUltima: number;

  @Column()
  ratio: number;

  @Column()
  mermaProcesada: number;

  @Column()
  mermaCortada: number;

  @Column()
  totalCajas: number;

  @OneToMany((type) => Cajas, (cajas) => cajas.merma)
  cajas: Cajas[];

  @ManyToOne((type) => Ranch, (Ranch) => Ranch.merma)
  Ranch: number | Ranch;

  @CreateDateColumn()
  createdAt: Date;
}
