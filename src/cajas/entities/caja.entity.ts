import { Merma } from 'src/merma/entities/merma.entity';
import { Sku } from 'src/sku/entities/sku.entity';
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';

@Entity({ synchronize: true })
export class Caja {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'double precision' })
  cantidad: number;

  @Column({ type: 'double precision' })
  cantidadR: number;

  @ManyToOne((type) => Sku, (Sku) => Sku.cajas)
  sku: number | Sku;

  @ManyToOne((type) => Merma, (merma) => merma.cajas, {
    cascade: true,
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  merma: number;
}
