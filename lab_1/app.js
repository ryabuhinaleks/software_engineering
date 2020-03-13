let express = require('express');
let app = express();
 
//Лабораторная работа № 1


//Задание 1____http://localhost:8081/z1/123
app.get("/z1/:parametr", (req, res)=>
	{
		let number={
			num: req.params.parametr,
		}
		let json = JSON.stringify(number);	
		res.send(json);
	});
 
 
//Задание 2____http://localhost:8081/z2/?a=1&b=-2&c=-3
app.get('/z2', (req, res)=>
{
    let a = req.query.a;
    let b = req.query.b;
    let c = req.query.c;	
    let D = Math.pow(b,2)-4*a*c;
	let obj={};
	
	if (D < 0)
		obj.answer="Дискриминант меньше 0";
	
	else if (D==0)
		obj.x=-b / (2 * a);
	
	else
	{
		obj.x1=x1=(-b + (Math.sqrt(D))) / (2 * a);
        obj.x2=x2 =(-b - (Math.sqrt(D))) / (2 * a);
    };
	
	let json = JSON.stringify(obj);	
	res.send(json);
});
 
//Задание 3____http://localhost:8081/z3/?date=10.11.1999
app.get('/z3', (req, res)=>
{
	let getDate=new Date(req.query.date);
    let dayWeek = ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'];
	
	let json = JSON.stringify({date: dayWeek[getDate.getDay()]});	
    res.send(json);
}); 


//Задание 4____http://localhost:8081/z4/20
 app.get("/z4/:parametr", (req, res)=>
{
    let number = req.params.parametr;
    let golden_section=(1+ Math.sqrt(5))/2;
	let Formula_Bine=(Math.pow(golden_section,number)-(Math.pow(-golden_section,-number)))/(2*golden_section-1);
	let obj={
		fibonacci:Formula_Bine.toFixed(),
	}
	let json = JSON.stringify(obj);	
    res.send(json);
});


//Задание 5____http://localhost:8081/z5/86
let needle=require("needle");
let cheerio= require("cheerio");
url="https://base.garant.ru/71317004/5da741911cf9399494368b18de80fbe8/"; // Справочник "Коды субъектов Российской Федерации"
 app.get("/z5/:parametr", (req, res)=>
{
    let number = req.params.parametr;
	needle.get(url, (req1, res1)=>
	{	
	let subject={};	
		let $= cheerio.load(res1.body);
		
		$('tr').each(function() 
		{
			let children = $(this).children();
			let code_subject = children.eq(0).text().trim();
			
		    let code=Number.parseInt(code_subject);
		    let num=Number.parseInt(number);
			if(code===num)
			{
				let name_subject = children.eq(1).text().trim();
				subject[number]=name_subject.toString();				
			}		
		});
	let json = JSON.stringify(subject);	
	res.send(json);
	});
});


var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})