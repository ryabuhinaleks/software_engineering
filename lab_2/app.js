let express = require('express');
let app = express();
let mysql = require('mysql');


function connect()
{
	let con = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: '',
		database: 'Laba_2'
		});		
	con.connect();
	return con;
}

//select___http://localhost:8081/sel/?table=service
app.get("/sel", (req, res)=>
{
	let con=connect();
	let name_table=req.query.table;
	con.query("call proc(?,?,?,?,?)", [name_table, 'sel', '-', '-', '-'], function(err, result) {
	if (err) throw err;		
		res.send(result[0]);
	});
	con.end();
});

//insert___http://localhost:8081/ins/?table=service&param1=repairs&param2=111
app.get("/ins", (req, res)=>
{
	let con=connect();
	let name_table=req.query.table;
	let param1=req.query.param1;
	let param2=req.query.param2;
	
	if (param1==undefined) param1='-';
    if (param2==undefined) param2='-';

	con.query("call proc(?,?,?,?,?)", [name_table, 'ins', param1, param2, '-'], function(err, result) {
	if (err) throw err;
		res.send("Данные добавлены");
	});
	con.end();
	
});

//delete___http://localhost:8081/del/?table=service&id=2
app.get("/del", (req, res)=>
{
	let con=connect();
	let name_table=req.query.table;
	let id=req.query.id;
	con.query("call proc(?,?,?,?,?)", [name_table, 'del', id, '-', '-'], function(err, result) {
	if (err) throw err;
		res.send("Запись удалена");
	});
	con.end();
});

//update___http://localhost:8081/upd/?table=service&param1=cleaning&param2=1000&id=1
app.get("/upd", (req, res)=>
{
	let con=connect();
	let name_table=req.query.table;
	let param1=req.query.param1;
	let param2=req.query.param2;
	let id=req.query.id;
	con.query("call proc(?,?,?,?,?)", [name_table, 'upd', param1, param2, id], function(err, result) {
	if (err) throw err;
		res.send("Данные обновлены");
	});
	con.end();
});

var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})