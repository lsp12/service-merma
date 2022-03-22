import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Color {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  color: string;

  @Column({ nullable: true })
  semana: number;

  @OneToMany((type) => PerfilRacimo, (PerfilRacimo) => PerfilRacimo.color)
  perfilRacimo: number | PerfilRacimo;
}
