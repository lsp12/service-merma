import { Module } from '@nestjs/common';
import { DesgloceMermaService } from './desgloce-merma.service';
import { DesgloceMermaController } from './desgloce-merma.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DesgloceMerma } from './entities/desgloce-merma.entity';

@Module({
  imports: [TypeOrmModule.forFeature([DesgloceMerma])],
  controllers: [DesgloceMermaController],
  providers: [DesgloceMermaService],
})
export class DesgloceMermaModule {}
