import { Caja } from 'src/cajas/entities/caja.entity';
import { Merma } from 'src/merma/entities/merma.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Sku {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  marca: string;

  @Column({ type: 'double precision' })
  peso: number;

  @Column({ type: 'double precision', default: 0 })
  clusters: number;

  @Column({ type: 'double precision', default: 0 })
  dedosMin: number;

  @Column({ type: 'double precision', default: 0 })
  dedosMax: number;

  @Column({ type: 'double precision', default: 0 })
  pesoFrutaFundaMin: number;

  @Column({ type: 'double precision', default: 0 })
  pesoFrutaFundaMax: number;

  @Column({ type: 'double precision', default: 0 })
  calibracionMin: number;

  @Column({ type: 'double precision', default: 0 })
  calibracionMax: number;

  @Column({ type: 'double precision', default: 0 })
  largoDedoMin: number;

  @Column({ type: 'double precision', default: 0 })
  largoDedoMax: number;

  @Column({ nullable: true })
  empresa: string;

  @Column({ default: false })
  tercero: boolean;

  @OneToMany(() => Caja, (Caja) => Caja.sku)
  cajas: Caja[];
}
