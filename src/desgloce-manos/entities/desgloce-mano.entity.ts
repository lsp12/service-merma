import { Defecto } from 'src/defectos/entities/defecto.entity';
import { Merma } from 'src/merma/entities/merma.entity';
import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class DesgloceMano {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  numManosPr: number;

  @Column()
  numManosUl: number;

  @ManyToOne(() => Defecto, (Defecto) => Defecto.desgloceMermas)
  defecto: Defecto;

  @ManyToOne(() => Merma, (Merma) => Merma.DesgloceManos, {
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE',
  })
  perfilRacimo: number | Merma;
}
