//Dependencies
import * as fs from "fs";

//archivos
import MysqlHelper from "../libs/mysql-helper";
import nodemailerHelper from "../libs/nodemailer-helper";

export default class Controller {
  public config: JSON;
  public mysqlClient: MysqlHelper;
  public nodemailer: nodemailerHelper;

  constructor() {
    this.config = JSON.parse(fs.readFileSync("./config/config.json", "utf8"));
    this.mysqlClient = new MysqlHelper(this.config);
    this.nodemailer = new nodemailerHelper(this.config);
  }

  async postContacto(req, res) {
    let contact = {
      nombre: req.body.nombre,
      apellidos: req.body.apellidos,
      email: req.body.email,
      empresa: req.body.empresa,
      descripcion: req.body.descripcion,
      publicidad: req.body.publicidad,
    };

    if (contact.publicidad == true) {
      await this.saveContact(req, res);
    }

    await this.nodemailer.mail(req, res);
    setTimeout(() => {
      res.status(200).send({ status: 200, message: "successfull" });
    }, 6000);
  }

  async saveContact(req, res) {
    let object = {
      nombre: req.body.nombre,
      apellidos: req.body.apellidos,
      email: req.body.email,
      empresa: req.body.empresa,
      descripcion: req.body.descripcion,
      publicidad: req.body.publicidad,
    };

    let response: any;
    response = await this.mysqlClient.query(
      `INSERT INTO tcontacto(nombre,apellidos,correo) values('${
        object.nombre
      }','${object.apellidos}','${object.email}');`
    );
    if (response == undefined) {
      res.status(400).send({ status: 400, message: "Ocurrio un error" });
      throw new Error("Ocurrio un error en la consulta");
    }
  }

  async getImageInicio(req, res) {
    let values = [];
    let response: any = await this.mysqlClient.query(
      `select * from timageninicio;`
    );
    if (response != undefined) {
      for (let i = 0; i < response.length; i++) {
        values.push({
          imagen: response[i].imagen,
        });
      }
    }

    response != undefined
      ? res.status(200).send(values)
      : res.status(400).send("ocurrio un error al obtener las imagenes");
  }

  async getDocuments(req, res) {
    let response: any = await this.mysqlClient.query(
      `select * from tdescarga;`
    );
    let values = [];

    if (response != undefined) {
      for (let i of response) {
        values.push({
          titulo: i.titulo,
          enlace: i.enlace,
          imagen: i.imagen,
        });
      }
    }

    response != undefined
      ? res.status(200).send(values)
      : res.status(400).send("Ocurrio un error en documentos");
  }

  async getEventos(req, res) {
    let values = [];
    let response: any = await this.mysqlClient.query(`select * from teventos;`);

    if (response != undefined) {
      for (let i of response) {
        values.push({
          id: i.id_evento,
          titulo: i.titulo,
          descripcion: i.descripcionbreve,
          imagen: i.imagenportada,
        });
      }
      res.status(200).send(values);
    } else res.status(400).send("ocurrio un error al obtener los datos");
  }

  async getDataEvento(req, res) {
    let id: string = req.params.id;
    let values = {};
    let documento = [];
    let imagen = [];

    let responsedata: any = await this.mysqlClient.query(
      `select * from teventos where id_evento = ${id};`
    );
    
    if(responsedata != undefined){
      let responseimage: any = await this.mysqlClient.query(
        `select * from teventosgaleria where id_evento= ${id}`
      );
  
      let responsedocuments: any = await this.mysqlClient.query(
        `select * from tdocumentos where id_evento= ${id}`
      );
      if (responseimage != undefined)
        for (let i of responseimage) {
          imagen.push({
            titulo: i.titulo,
            imagen: i.imagen,
          });
        }
  
      if (responsedocuments != null)
        for (let h of responsedocuments) {
          documento.push({
            titulo: h.titulo,
            link: h.link,
          });
        }
  
      values = {
        id: responsedata[0].id_evento,
        titulo: responsedata[0].titulo,
        descripcion: responsedata[0].descripcion,
        imagenPrincipal: responsedata[0].imagenportada,
        galleria: imagen,
        documentos: documento,
      }
      res.status(200).send(values);
    }else
    res.status(400).send("usuario no encontrado");
  }
}
