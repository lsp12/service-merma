import { Color } from 'src/color/entities/color.entity';
import { Merma } from 'src/merma/entities/merma.entity';
import { Entity, ManyToOne, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class ColoredBunch {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cantidad: number;

  @Column()
  edadSemana: number;

  @ManyToOne((type) => Color, (Color) => Color.coloredBunches, {
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE',
  })
  color: Color;

  @ManyToOne((type) => Merma, (Merma) => Merma.coloredBunches, {
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE',
  })
  merma: Merma;
}
