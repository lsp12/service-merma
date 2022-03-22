import { DesgloceMerma } from 'src/desgloce-merma/entities/desgloce-merma.entity';
import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { TipoDefecto } from 'src/tipo-defecto/entities/tipo-defecto.entity';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Defecto {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column()
  siglas: string;

  @ManyToOne((type) => TipoDefecto, (TipoDefecto) => TipoDefecto.defectos, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  tipoDefecto: number | TipoDefecto;

  @OneToMany(
    (type) => DesgloceMerma,
    (DesgloceMerma) => DesgloceMerma.defecto,
    {
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
    },
  )
  desgloceMermas: DesgloceMerma[];
}
