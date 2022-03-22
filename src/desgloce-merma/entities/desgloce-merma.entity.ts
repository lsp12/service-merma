import { Defecto } from 'src/defectos/entities/defecto.entity';
import { PerfilRacimo } from 'src/perfil-racimos/entities/perfil-racimo.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class DesgloceMerma {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cantidad: number;

  @Column()
  peso: number;

  @ManyToOne(() => PerfilRacimo, (PerfilRacimo) => PerfilRacimo.DesgloceMermas)
  perfilRacimo: number | PerfilRacimo;

  @ManyToOne(() => Defecto, (Defecto) => Defecto.desgloceMermas)
  defecto: Defecto;
}
