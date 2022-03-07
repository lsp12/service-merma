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

  @OneToMany((type) => Merma, (Merma) => Merma.sku)
  merma: Merma[];
}
