import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Merma } from './merma.entity';
import { Zona } from './zona.entity';

@Entity()
export class Ranch {
  @PrimaryGeneratedColumn()
  idHaciendad: number;

  @Column()
  nombre: string;

  @Column()
  condigoHacienda: string;

  @ManyToOne(() => Zona, (Zona) => Zona.ranch)
  zona: number;

  @OneToMany(() => Merma, (Merma) => Merma.ranch)
  merma: Merma[];
}
