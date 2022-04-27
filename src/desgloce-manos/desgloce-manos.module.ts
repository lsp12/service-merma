import { Module } from '@nestjs/common';
import { DesgloceManosService } from './desgloce-manos.service';
import { DesgloceManosController } from './desgloce-manos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DesgloceMano } from './entities/desgloce-mano.entity';

@Module({
  imports: [TypeOrmModule.forFeature([DesgloceMano])],
  controllers: [DesgloceManosController],
  providers: [DesgloceManosService],
})
export class DesgloceManosModule {}
