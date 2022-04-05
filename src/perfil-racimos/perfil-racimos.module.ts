import { Module } from '@nestjs/common';
import { PerfilRacimosService } from './perfil-racimos.service';
import { PerfilRacimosController } from './perfil-racimos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PerfilRacimo } from './entities/perfil-racimo.entity';
import { PesoManoModule } from 'src/perfiles/peso-mano/peso-mano.module';

@Module({
  imports: [TypeOrmModule.forFeature([PerfilRacimo]), PesoManoModule],
  controllers: [PerfilRacimosController],
  providers: [PerfilRacimosService],
})
export class PerfilRacimosModule {}
