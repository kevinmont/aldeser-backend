//Dependencias
import * as express from 'express';
import * as bodyparser from 'body-parser';
import * as cors from "cors";

//archivos
import Routes from './routes/routes';

class App{

	public app: express.Application;
	public routes: Routes;

	constructor(){
		this.app= express();
		this.routes=new Routes;
		this.config();
		this.routes.ruteador(this.app);
	}

	config(){
		this.app.use(bodyparser.json());
		this.app.use(bodyparser.urlencoded({extended: false}));
		this.app.use(cors());
	}
}

export default new App().app;

