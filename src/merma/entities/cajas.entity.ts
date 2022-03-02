import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Merma } from './merma.entity';

@Entity()
export class Cajas {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  marca: string;

  @Column()
  peso: number;

  @Column()
  cantidad: number;

  @ManyToOne((type) => Merma, (merma) => merma.cajas, {
    cascade: true,
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  merma: number;
}
