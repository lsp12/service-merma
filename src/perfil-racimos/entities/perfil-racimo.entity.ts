import { Color } from 'src/color/entities/color.entity';
import { DesgloceMerma } from 'src/desgloce-merma/entities/desgloce-merma.entity';
import { Merma } from 'src/merma/entities/merma.entity';
import { Calibracion } from 'src/perfiles/peso-mano/entities/calibracion';
import { LongitudDedos } from 'src/perfiles/peso-mano/entities/longitud-dedos';
import { NumeroDedos } from 'src/perfiles/peso-mano/entities/numero-dedos.entity';
import { PesoMano } from 'src/perfiles/peso-mano/entities/peso-mano.entity';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class PerfilRacimo {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'double precision' })
  pesoTallo: number;

  @Column()
  nRacimo: number;

  @Column()
  lote: number;

  @Column({ default: false })
  defectosY: boolean;

  @ManyToOne(() => Color, (Color) => Color.perfilRacimo, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  color: number | Color;

  @ManyToOne(() => Merma, (Merma) => Merma.perfilRacimos, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  merma: number | Merma;

  @OneToMany(() => Calibracion, (Calibracion) => Calibracion.perfilRacimo)
  calibraciones: Calibracion[];

  @OneToMany(() => LongitudDedos, (LongitudDedos) => LongitudDedos.perfilRacimo)
  longitudDedos: LongitudDedos[];

  @OneToMany(() => NumeroDedos, (NumeroDedos) => NumeroDedos.perfilRacimo)
  numeroDedos: NumeroDedos[];

  @OneToMany(() => PesoMano, (PesoMano) => PesoMano.perfilRacimo)
  pesoMano: PesoMano[];

  @OneToMany(() => DesgloceMerma, (DesgloceMerma) => DesgloceMerma.perfilRacimo)
  DesgloceMermas: DesgloceMerma[];
}
