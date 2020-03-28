let express = require('express');
let app = express();
let request = require('request');

app.get("/", (req, res)=>
{
	request.get("http://www.mocky.io/v2/5c7db5e13100005a00375fda", function(error, response, body)
	{
		let text_=body;
		let obj=JSON.parse(text_);
	
		let mass=obj.result.split(" ");
		obj.result=mass.join("_");
		
		let json = JSON.stringify(obj);	
		res.send(json);
	});	
});

let server = app.listen(8081, function () {
   let host = server.address().address
   let port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})