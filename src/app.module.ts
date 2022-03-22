import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { getConnectionOptions } from 'typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MermaModule } from './merma/merma.module';
import { SkuModule } from './sku/sku.module';
import { CajasModule } from './cajas/cajas.module';
import { DefectosModule } from './defectos/defectos.module';
import { PerfilRacimosModule } from './perfil-racimos/perfil-racimos.module';
import { ColorModule } from './color/color.module';
import { PesoManoModule } from './perfiles/peso-mano/peso-mano.module';
import { TipoDefectoModule } from './tipo-defecto/tipo-defecto.module';
import { DesgloceMermaModule } from './desgloce-merma/desgloce-merma.module';

@Module({
  imports: [
    MermaModule,
    TypeOrmModule.forRootAsync({
      useFactory: async () =>
        Object.assign(await getConnectionOptions(), {
          autoLoadEntities: true,
        }),
    }),
    SkuModule,
    CajasModule,
    DefectosModule,
    PerfilRacimosModule,
    ColorModule,
    PesoManoModule,
    TipoDefectoModule,
    DesgloceMermaModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
