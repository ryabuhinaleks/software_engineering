let express = require('express');
let app = express();
let soap = require('soap');


/*
	Запуск WSDL
		1. WCFService1-->WCFService1.sln //Открыть файл с помощью Visual Studio
		2. Кнопка IIS Express
		3. Запустится веб сервис по адресу http://localhost:53437/WebService.asmx

	WSDL: http://localhost:53437/WebService.asmx?wsdl
	
	WSDL: GetTable- Получить данные из указанной таблицы.
		  AddTable- Добавить данные в указанную таблицу.
		  UpdateTable - Изменить данные по id и названию таблицы.
		  DeleteTable- Удалить данные по id.
		  
	Запуск Сервера
		1. npm start
*/


let url = 'http://localhost:53437/WebService.asmx?wsdl';

// http://localhost:8081/sel - Запрос Select
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


// http://localhost:8081/ins - Запрос Insert
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


//delete___http://localhost:8081/del
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