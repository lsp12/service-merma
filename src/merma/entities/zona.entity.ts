import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Ranch } from './ranch.entity';

@Entity({ synchronize: false })
export class Zona {
  @PrimaryGeneratedColumn()
  idZona: number;

  @Column()
  nombre: string;

  @OneToMany(() => Ranch, (Ranch) => Ranch.zona)
  ranch: Ranch[];
}
