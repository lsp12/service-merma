import { Defecto } from 'src/defectos/entities/defecto.entity';
import { Merma } from 'src/merma/entities/merma.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class RejectedBunch {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cantidad: number;

  @Column()
  lote: number;

  @ManyToOne((type) => Defecto, (Defecto) => Defecto.rejectedBunches)
  defecto: Defecto;

  @ManyToOne((type) => Merma, (Merma) => Merma.rejectedBunches)
  merma: Merma;
}
