//Dependencias
import * as mysql from 'mysql';

export default class MysqlHelper{
	public pool: mysql.Pool;
	public config:any;

	constructor(config: any){
		this.config=config.mysql;
		let {host,port,user,password,database}=config.mysql;

		this.pool = mysql.createPool(
			{
				host,
				port,
				user,
				password,
				database
			});

			this.pool.getConnection((err,client)=>{
				if(err) throw console.log(`Cann't connect with Mysql ${err}`);
				console.log("conection successfull");
			});
	}

	async query(query: string){
		return new Promise((resolve,reject)=>{
			this.pool.query(query, (err:string, data:string)=>{
				if(err) console.log(`Error in query`);
				console.log("Data: " + JSON.stringify(data));
				resolve(data);
			});
		});
	}
}