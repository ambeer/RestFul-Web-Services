var formidable 	= 	require('formidable');
var mysql   	= 	require("mysql"); 
var multer  	=  	require("multer");
var util 		= 	require('util');
var upload 		= 	multer({ dest: 'public/images/' });
var fs 			= 	require('fs');
var type 		= 	upload.single('imagePath');



function REST_ROUTER(router,connection) {
    var self = this;
    self.handleRoutes(router,connection);
}
REST_ROUTER.prototype.handleRoutes = function(router,connection) {
    var self = this;
	
    router.get("/",function(req,res){		 
        res.render('default', {title : 'TechAspect Classifieds', classname : 'Home' , message :"This is a internal classified application where employees can post their add so that others can search",}); 
    });
    router.post("/postAdd", function(req, res){				
		var data = {classifiedID:req.body.ClassifiedID,name:req.body.Name,description:req.body.Description,price:req.body.Amount,email:req.body.email,phoneno:req.body.phoneno };
		var output = connection.query('INSERT INTO classified SET ?', data, function(err, result) {
		if(err) {
			res.status(400);
			res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
		} else {
				res.json({"resultInfo" : "Success", "Message" : "Your add posted successfully", "classifiedId" : req.body.ClassifiedID});
			}
		});		 
 });    
		
	router.post("/fileupload", function(req, res){			
		var form = new formidable.IncomingForm();
		var id, tmp_path;		
		form.parse(req, function(err, fields, files) {
			var tmp_path = files.file.path;
			var target_path = 'public/uploads/'+ files.file.name;
			
			/** A better way to copy the uploaded file. **/
			var src = fs.createReadStream(tmp_path);
			var dest = fs.createWriteStream(target_path);
			src.pipe(dest);
		  
			var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
			var table = ["classified","imagepath",target_path,"classifiedID",fields.id];
			query = mysql.format(query,table);
			connection.query(query,function(err,rows){
				if(err) {
					res.json({"Error" : true, "Message" : "Error executing MySQL query"});
				} else {
					res.json({"Error" : false, "Message" : "Updated Image path for classifiedID: "+fields.id});
				}
			});		
		});		 
	});

	router.post("/navigation", function(req, res){	
		var data = [];
		var sessionid = req.body.id;
		console.log(sessionid + "SessionID");
		var requiredSession = '';		
		if(sessionid){
			var sessionStore = req.sessionStore;			 
			data = JSON.parse(sessionStore.sessions[sessionid]);			 				
			res.json({"isLoggedIn" : "true", "email": data.email, "name" : data.name});				
		}else{
			res.json({"isLoggedIn" : "false", "email": "", "name" : ""});	
		} 
    });
	
	router.get("/logout", function(req, res){		 
		sessionid = '';
		req.session.destroy(function(err){
			if(err){
				console.log(err);
			}
			else
			{
				res.json({"isLoggedOut" : "true"});	
			}
		});		
		//console.log(util.inspect(req));
    });

    router.get("/fetchAdds", function(req,res){ 	
		var query = "SELECT * FROM ??";
		var table = ["classified"];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
			if(err) {
				res.status(400);
				res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
			} else {
				res.json({"resultInfo" : "Success", "Message": rows});
			}
		});		 	
    });
	
	router.post("/myAdds", function(req,res){ 	
		//console.log(req.body);
		//console.log(req.body.email + "Email from UI");
		var email = req.body.email + '@techaspect.com';
		console.log(email);
		var query = "SELECT * FROM ?? WHERE ??=?";
		var table = ["classified","email", email];		
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
			if(err) {
				res.status(400);
				res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
			} else {
				res.json({"resultInfo" : "Success", "Message": rows});
			}
		});		 	
    });
	
	router.post("/signup", function(req, res){	
		var data = {username:req.body.username,password:req.body.password,email:req.body.email,phone:req.body.phoneno};
		var output = connection.query('INSERT INTO user SET ?', data, function(err, result) {
		if(err) {
			res.status(400);
			res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
		} else {
				res.json({"resultInfo" : "Success", "Message" : "User added successfully"});
			}
		});  		 			
    });

    router.get("/fetchAdds/:id", function(req,res){		
		var query = "SELECT * FROM ?? WHERE ??=?";
		var table = ["classified","classifiedID",req.params.id];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
			if(err) {
				res.status(400);
				res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
			 } else {
				 res.json({"resultInfo" : "Success", "Message" : rows});
			 }
		});		 
    }); 
	
	router.post("/login", function(req,res){			 
		var sessionid = req.sessionID;
		var email = req.body.email;
		var password = req.body.password;
		var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";
		var table = ["user","email",email, "password", password];
		query = mysql.format(query,table);
		connection.query(query, function(err,rows){			
			if(rows.length == 0) {
				res.status(400);
				res.json({"resultInfo" : "Error", "Message" : "Invalid Username Or Password"});
			} else {
				req.session.email = rows[0].email;
				req.session.name = rows[0].username;	
				res.json({"resultInfo" : "Success", "id" : sessionid, "email" : rows[0].email, "user" : rows[0].username, "phoneno" : rows[0].phone});
			}
		});		 
    }); 
	
    router.post("/forgotpassword", function(req,res){	 
		var email = req.body.EmailID;
		var query = "SELECT * FROM ?? WHERE ??=?";
		var table = ["user","email",email];
		query = mysql.format(query,table);
		connection.query(query, function(err,rows){			
			if(rows.length == 0) {
				res.json({"resultInfo" : "Error", "isRegistered" : false});
			 } else {
				res.json({"resultInfo" : "Success", "isRegistered" : true, "email" : email});
				 
			 }
		});		 
    });
	
	router.post("/resetpassword",function(req,res){
		var pass = req.body.ConPassword;
		var email = req.body.ConEmailId;
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["user","password",pass,"email",email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"resultInfo" : "Error", "Message" : "Error in updating passowrd"});
            } else {
                res.json({"resultInfo" : "Success", "Message" : "Your new password updated successfully"});
            }
        });
    });

    router.post("/contactus", function(req,res){	
		var data = {name:req.body.Name,email:req.body.Email,subject:req.body.Subject,message:req.body.Message};        
		var output = connection.query('INSERT INTO contact SET ?', data, function(err, result) {
			if(err) {
				res.status(400);
				res.json({"resultInfo" : "Error", "Message" : "Error executing database query"});
			} else {
				res.json({"resultInfo" : "Success", "Message" : "Your message submitted successfully"});
			}
		});  		 
    });	
}
module.exports = REST_ROUTER;
