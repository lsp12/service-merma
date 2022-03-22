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

  @Column({ type: 'double precision' })
  clusters: number;

  @Column({ type: 'double precision' })
  dedosMin: number;

  @Column({ type: 'double precision' })
  dedosMax: number;

  @Column({ type: 'double precision' })
  pesoFrutaFundaMin: number;

  @Column({ type: 'double precision' })
  pesoFrutaFundaMax: number;

  @Column({ type: 'double precision' })
  calibracionMin: number;

  @Column({ type: 'double precision' })
  calibracionMax: number;

  @Column({ type: 'double precision' })
  largoDedoMin: number;

  @Column({ type: 'double precision' })
  largoDedoMax: number;

  @Column()
  empresa: string;

  @OneToMany((type) => Caja, (Caja) => Caja.sku)
  cajas: Caja[];
}
