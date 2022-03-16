import { Sku } from 'src/sku/entities/sku.entity';
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

@Entity({ synchronize: false })
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

  @Column()
  numManosVotadasP: number;

  @Column()
  numManosVotadasU: number;

  @CreateDateColumn()
  createdAt: Date;

  @OneToMany((type) => Cajas, (cajas) => cajas.merma)
  cajas: Cajas[];

  @ManyToOne((type) => Ranch, (Ranch) => Ranch.merma)
  Ranch: number | Ranch;

  @ManyToOne((type) => Sku, (Sku) => Sku.merma, {
    cascade: true,
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  sku: number | Sku;
}
