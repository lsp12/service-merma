import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class NumeroDedos {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  numMano: number;

  @Column()
  numDedos: number;

  @ManyToOne(
    (type) => PerfilRacimo,
    (PerfilRacimo) => PerfilRacimo.calibraciones,
  )
  perfilRacimo: number | PerfilRacimo;
}
