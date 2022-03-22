import { Module } from '@nestjs/common';
import { MermaService } from './merma.service';
import { MermaController } from './merma.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Merma } from './entities/merma.entity';
import { Ranch } from './entities/ranch.entity';
import { Zona } from './entities/zona.entity';
import { CajasModule } from 'src/cajas/cajas.module';

@Module({
  imports: [TypeOrmModule.forFeature([Merma, Ranch, Zona]), CajasModule],
  controllers: [MermaController],
  providers: [MermaService],
})
export class MermaModule {}
