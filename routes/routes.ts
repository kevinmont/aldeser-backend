//Dependencias
import * as express from 'expres';

//Archivos
import Controller from '../controller/controller';
export default class Routes{

	public controller: Controller;

	constructor(){
		this.controller= new Controller();
	}

	ruteador(app: express.Application){
		app.route("/contacto")
		.post((req,res)=>{
			this.controller.postContacto(req,res);
		});

		app.route("/home")
		.get((req,res)=>{
			this.controller.getImageInicio(req,res);
		});

		app.route("/documentos")
		.get((req,res)=>{
			this.controller.getDocuments(req,res);
		});

		app.route("/eventos")
		.get((req,res)=>{
			this.controller.getEventos(req,res);
		});

		app.route('/eventos/:id')
		.get((req,res)=>{
			this.controller.getDataEvento(req,res);
		});
	}

}