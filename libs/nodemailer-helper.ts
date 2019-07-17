export default class NodeMailerHelper {
  public config: any;
  public nodemailer = require("nodemailer");

  public message: string;

  constructor(config: any) {
    this.config = config.sendEmail;
  }

  async mail(req, res) {
    let object = {
      nombre: req.body.nombre,
      apellidos: req.body.apellidos,
      email: req.body.email,
      empresa: req.body.empresa,
      descripcion: req.body.descripcion,
      publicidad: req.body.publicidad,
    };

    let transporter = this.nodemailer.createTransport({
      service: `${this.config.service}`,
      auth: {
        user: `${this.config.account}`,
        pass: `${this.config.password}`,
      },
    });

    let info = {
      from: `${object.email}`,
      to: `${this.config.account}"`,
      subject: "Cuestions",
      html: `"
			<h1> ${object.nombre} ${object.apellidos} </h1>
			<br>
			Empresa: ${object.empresa || "No definido"}
      <br>
      Descripción de la pregunta:
      <br>
      ${object.descripcion}
      <br><br>
      Responder al correo ${object.email}
			`,
    };

    transporter.sendMail(info, (err, res) => {
      if (err) throw new Error("Ocurrio un error al enviar el mensaje");
    });
  }
}
