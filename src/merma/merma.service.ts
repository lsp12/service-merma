import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateMermaDto } from './dto/create-merma.dto';
import { UpdateMermaDto } from './dto/update-merma.dto';
import { Cajas } from './entities/cajas.entity';
import { Merma } from './entities/merma.entity';

@Injectable()
export class MermaService {
  constructor(
    @InjectRepository(Merma)
    private MermaRepository: Repository<Merma>,
    @InjectRepository(Cajas)
    private CajasRepository: Repository<Cajas>,
  ) {}
  async create(createMermaDto: CreateMermaDto) {
    const { rCortado, rProcesado, cajas, cajaR, pesoFruta } = createMermaDto;
    createMermaDto.rCortado = pesoFruta * rCortado;
    createMermaDto.rProcesado = pesoFruta * rProcesado;
    const rRechazado = createMermaDto.rCortado - createMermaDto.rProcesado;

    const pesoCaja = cajas.map((caja) => {
      return caja.peso * caja.cantidad;
    });

    const pesoCajaR =
      cajaR?.length < 0 &&
      cajaR.map((caja) => {
        return caja.peso * caja.cantidad;
      });

    const pesoProcesado =
      createMermaDto.rProcesado - pesoCaja.reduce((a, b) => a + b, 0);
    const pesoRechazado =
      pesoProcesado +
      (pesoCajaR ? pesoCajaR.reduce((a, b) => a + b, 0) : 0) +
      rRechazado;

    const porcentajeRechazado =
      (pesoProcesado / createMermaDto.rProcesado) * 100;
    const procentajeCRechazado =
      (pesoRechazado / createMermaDto.rCortado) * 100;

    const ratio =
      ((rProcesado - pesoProcesado / pesoFruta) /
        (pesoCaja.reduce((a, b) => a + b, 0) / 42)) *
      100;

    const merma = this.MermaRepository.create({
      ...createMermaDto,
      totalCajas: pesoCaja.reduce((a, b) => a + b, 0) / 42,
      mermaCortada: pesoRechazado / pesoFruta,
      mermaProcesada: pesoProcesado / pesoFruta,
    });
    console.log(merma);

    return {
      rCortado: createMermaDto.rCortado,
      rProcesado: createMermaDto.rProcesado,
      rRechazado: rRechazado / pesoFruta,
      pesoCaja: pesoCaja,
      pesoCajaR: pesoCajaR || 0,
      mermaProcesado: pesoProcesado / pesoFruta,
      mermaRechazado: pesoRechazado / pesoFruta,
      porcentajeRechazado,
      procentajeCRechazado,
      ratio,
    };
  }

  findAll() {
    return `This action returns all merma`;
  }

  findOne(id: number) {
    return `This action returns a #${id} merma`;
  }

  update(id: number, updateMermaDto: UpdateMermaDto) {
    return `This action updates a #${id} merma`;
  }

  remove(id: number) {
    return `This action removes a #${id} merma`;
  }
}
