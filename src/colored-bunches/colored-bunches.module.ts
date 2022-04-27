import { Module } from '@nestjs/common';
import { ColoredBunchesService } from './colored-bunches.service';
import { ColoredBunchesController } from './colored-bunches.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ColoredBunch } from './entities/colored-bunch.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ColoredBunch])],
  controllers: [ColoredBunchesController],
  providers: [ColoredBunchesService],
})
export class ColoredBunchesModule {}
