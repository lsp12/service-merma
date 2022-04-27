import { Module } from '@nestjs/common';
import { RejectedBunchesService } from './rejected-bunches.service';
import { RejectedBunchesController } from './rejected-bunches.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RejectedBunch } from './entities/rejected-bunch.entity';

@Module({
  imports: [TypeOrmModule.forFeature([RejectedBunch])],
  controllers: [RejectedBunchesController],
  providers: [RejectedBunchesService],
})
export class RejectedBunchesModule {}
