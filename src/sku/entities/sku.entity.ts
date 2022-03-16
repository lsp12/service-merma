import { Merma } from 'src/merma/entities/merma.entity';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Sku {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  marca: string;

  @Column()
  peso: number;

  @Column()
  clusters: number;

  @Column()
  dedosMin: number;

  @Column()
  dedosMax: number;

  @Column()
  pesoFrutaFundaMin: number;

  @Column()
  pesoFrutaFundaMax: number;

  @Column()
  calibracionMin: number;

  @Column()
  calibracionMax: number;

  @Column()
  largoDedoMin: number;

  @Column()
  largoDedoMax: number;

  @Column()
  empresa: string;

  @OneToMany((type) => Merma, (Merma) => Merma.sku)
  merma: Merma[];
}
