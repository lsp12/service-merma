import { Module } from '@nestjs/common';
import { PerfilRacimosService } from './perfil-racimos.service';
import { PerfilRacimosController } from './perfil-racimos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PerfilRacimo } from './entities/perfil-racimo.entity';

@Module({
  imports: [TypeOrmModule.forFeature([PerfilRacimo])],
  controllers: [PerfilRacimosController],
  providers: [PerfilRacimosService],
})
export class PerfilRacimosModule {}
