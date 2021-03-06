import { Injectable, Logger } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import * as nodemailer from 'nodemailer';
import xoauth2 from 'xoauth2';

@Injectable()
export class TasksService {
  private readonly logger = new Logger(TasksService.name);

  /* @Cron('2 * * * * *') */
  /* @Cron('0 30 23 * * 1-6') */
  handleCron() {
    async function main() {
      // Generate test SMTP service account from ethereal.email
      // Only needed if you don't have a real mail account for testing
      /* const testAccount = await nodemailer.createTestAccount(); */

      // create reusable transporter object using the default SMTP transport
      /* const transporter = nodemailer.createTransport({
        host: 'smtp-mail.outlook.com',
        port: 587,
        secure: false, // true for 465, false for other ports
        tls: {
          ciphers: 'SSLv3',
        },
        auth: {
          user: 'estadisticaMerma852@hotmail.com', // generated ethereal user
          pass: 'Galito852', // generated ethereal password
        },
      }); */

      const transporter = nodemailer.createTransport({
        service: 'hotmail',
        auth: {
          user: 'estadisticaMerma852@hotmail.com', // generated ethereal user
          pass: 'Galito852', // generated ethereal password
        },
      });

      // send mail with defined transport object
      const info = await transporter.sendMail({
        from: '"Fred Foo 👻" <estadisticaMerma852@hotmail.com>', // sender address
        to: 'jonathankenny852@gmail.com', // list of receivers
        subject: 'Hello ✔', // Subject line
        text: 'Hello world?', // plain text body
        html: '<b>Prueba de texto?</b>', // html body
      });

      console.log('Message sent: %s', info.messageId);
      // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

      // Preview only available when sending through an Ethereal account
      console.log('Preview URL: %s', nodemailer.getTestMessageUrl(info));
      // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
    }

    main().catch(console.error);

    this.logger.debug('Called when the current second is 45');
  }
}
