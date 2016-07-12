var express		 = require("express");
var mysql   	 = require("mysql");
var session 	 = require('express-session');
var bodyParser   = require("body-parser");
var cookieParser = require("cookie-parser");
var cors 		 = require('cors');
var rest 		 = require("./routes/index.js");
var md5 		 = require('MD5');


var code = 'TAUIPRACTICE123@4567'; 
var app  = express();
app.use('/public', express.static('public'));
app.set('view engine', 'ejs');
app.use(cors());


function REST(){
    var self = this;
    self.connectMysql();
};

REST.prototype.connectMysql = function() {
    var self = this;
    var pool      =    mysql.createPool({
    	socketPath : '/var/run/mysqld/mysqld.sock',
	host     : 'localhost',
	port     : '1421',
	//port 	: 3306,
	user     : 'root',
	password : 'techaspect',
    	database : 'taclassifieds',
        debug    :  false
    });
    pool.getConnection(function(err,connection){
        if(err) {
          self.stop(err);
        } else {
          self.configureExpress(connection);
		      console.log('connected');
        }
    });
}

REST.prototype.configureExpress = function(connection) {
      var self = this;
      
      app.use(session({
	secret: code,
	saveUninitialized:false, 
	resave: false,
	cookie: { maxAge: 60000  }				
      }));
      app.use(bodyParser.urlencoded({ extended: true }));
      app.use(bodyParser.json());
      app.use(cookieParser(code));
      
      var router = express.Router();
      app.use('/taClassified', router);
      var rest_router = new rest(router,connection,md5);
      self.startServer();
}

REST.prototype.startServer = function() {
      app.listen(3000,function(){
          console.log("All right ! I am alive at Port 3000.");
      });
}

REST.prototype.stop = function(err) {
    console.log("ISSUE WITH MYSQL \n" + err);
    process.exit(1);
}

new REST();
