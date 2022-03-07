import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { getConnectionOptions } from 'typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MermaModule } from './merma/merma.module';
import { SkuModule } from './sku/sku.module';

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
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
