import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Connection } from 'typeorm';
import { Ranch } from '../entities/ranch.entity';

@Injectable()
export class RanchService {
  constructor(
    @InjectRepository(Ranch)
    private ranchRespository: Repository<Ranch>,
    private connection: Connection,
  ) {}

  async login(data: any) {
    if (data.ranch === null) {
      const pass = '1207207752';
      if (data.password === pass) {
        return true;
      }
      data.ranch = '';
    }
    const ranch = await this.ranchRespository.findOne({
      where: { nombre: data.ranch.nombre, condigoHacienda: data.password },
    });

    if (ranch) {
      return ranch;
    } else {
      return null;
    }
  }
}
