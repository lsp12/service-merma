import { Caja } from 'src/cajas/entities/caja.entity';
import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { Sku } from 'src/sku/entities/sku.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Ranch } from './ranch.entity';

@Entity({ synchronize: true })
export class Merma {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'double precision' })
  rCortado: number;

  @Column({ type: 'double precision' })
  rProcesado: number;

  @Column({ type: 'double precision' })
  rRechazados: number;

  @Column({ type: 'double precision' })
  pesoFruta: number;

  @Column({ type: 'double precision' })
  pesoRacimo: number;

  @Column({ type: 'double precision' })
  pesoTallo: number;

  @Column({ type: 'double precision' })
  edad: number;

  @Column({ type: 'double precision' })
  calibracion: number;

  @Column({ type: 'double precision' })
  calibracionUltima: number;

  @Column({ type: 'double precision' })
  nManos: number;

  @Column({ type: 'double precision' })
  pesoSegundaMano: number;

  @Column({ type: 'double precision' })
  pesoUltimaMano: number;

  @Column({ type: 'double precision' })
  lDedoSegunda: number;

  @Column({ type: 'double precision' })
  lDedoUltima: number;

  @Column({ type: 'double precision' })
  ratioC: number;

  @Column({ type: 'double precision' })
  ratioP: number;

  @Column({ type: 'double precision' })
  mermaProcesada: number;

  @Column({ type: 'double precision' })
  mermaCortada: number;

  @Column({ type: 'double precision' })
  totalCajas: number;

  @Column({ type: 'double precision' })
  numManosVotadasP: number;

  @Column({ type: 'double precision' })
  numManosVotadasU: number;

  @Column({ type: 'double precision' })
  pesoCaja: number;

  @Column({ type: 'date', nullable: true })
  fecha: Date;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @Column({ default: false })
  perfil: boolean;

  @Column()
  CantidadCJ: number;

  @OneToMany(() => Caja, (Caja) => Caja.merma)
  cajas: Caja[];

  @OneToMany(() => PerfilRacimo, (PerfilRacimo) => PerfilRacimo.merma)
  perfilRacimos: PerfilRacimo[];

  @ManyToOne(() => Ranch, (Ranch) => Ranch.merma)
  ranch: number | Ranch;
}
