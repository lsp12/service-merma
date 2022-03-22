import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class PesoMano {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  numMano: number;

  @Column({ type: 'double precision' })
  pesoMano: number;

  @ManyToOne(
    (type) => PerfilRacimo,
    (PerfilRacimo) => PerfilRacimo.calibraciones,
  )
  perfilRacimo: number | PerfilRacimo;
}
