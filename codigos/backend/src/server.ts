import * as restify from 'restify'
import { environment } from './constants/environment';
import { exit } from 'process';

export default new class Server {

    server: restify.Server;

    getServer(): restify.Server {
        return this.server;
    }

    start(): Promise<Server> {
        return new Promise((resolve, reject) => {

            const { PORT, NAME, VERSION } = environment.SERVER

            this.server = restify.createServer({
                name: NAME,
                version: VERSION,
            })

           
            console.log(`Iniciando a aplicação na porta ${PORT}`);

            this.server.listen(PORT, () => resolve(this));

            this.server.on('error', (e) => {
                console.log('Ocorreu um erro na aplicação. Reiniciando...');
                console.log(e)
                exit(1);
            });
        })
    }
}