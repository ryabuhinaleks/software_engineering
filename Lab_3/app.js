let express = require('express');
let app = express();
let soap = require('soap');

let url = 'http://localhost:53437/WebService.asmx?wsdl';


app.get("/sel", (req, res)=>
{
	let args = {table: 'applications'}; //name- название таблицы:applications, clients, services 

	soap.createClient(url, function(err, client) {
		client.GetTable(args, function(err, result) 
		{
			res.send(result);
		});
  });
});



app.get("/ins", (req, res)=>
{
	let args = {table: 'clients', param1:'new Data1', param2:'new Data2'}; //name- название таблицы:applications, clients, services 

	soap.createClient(url, function(err, client) {
		client.AddTable(args, function(err, result) 
		{
			res.send(result);
		});
  });
});


//update___http://localhost:8081/upd - Запрос Update
app.get("/upd", (req, res)=>
{
	let args = {table: 'services', param1:'new Data1', param2:'new Data2', id:'1'}; //name- название таблицы:applications, clients, services 

	soap.createClient(url, function(err, client) {
		client.UpdateTable(args, function(err, result) 
		{
			res.send(result);
		});
  });
});


app.get("/del", (req, res)=>
{
	let args = {table: 'clients', id:'5'}; //name- название таблицы:applications, clients, services 

	soap.createClient(url, function(err, client) {
		client.DeleteTable(args, function(err, result) 
		{
			res.send(result);
		});
  });
});


var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})
