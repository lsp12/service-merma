import { Defecto } from 'src/defectos/entities/defecto.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TipoDefecto {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @OneToMany(() => Defecto, (Defecto) => Defecto.tipoDefecto)
  defectos: Defecto[];
}
