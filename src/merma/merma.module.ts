import { Module } from '@nestjs/common';
import { MermaService } from './merma.service';
import { MermaController } from './merma.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Merma } from './entities/merma.entity';
import { Cajas } from './entities/cajas.entity';
import { Ranch } from './entities/ranch.entity';
import { Zona } from './entities/zona.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Merma, Cajas, Ranch, Zona])],
  controllers: [MermaController],
  providers: [MermaService],
})
export class MermaModule {}
