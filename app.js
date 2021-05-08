// Import packages
var express = require('express'),
    expressSession = require('express-session'),
    path = require('path'),
    bodyParser = require('body-parser'),
    cons = require('consolidate'),
    dust = require('dustjs-helpers'),
    pg = require('pg'),
    app = express();

// Db config
var connectionString = 'postgres://recipebook_user:P@ssw0rd@localhost/recipebook_db';

// Views config
app.engine('dust', cons.dust);
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

// Define Public directory
app.use(express.static(path.join(__dirname, 'public')));

// BodyParser Middleware config
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', function(request, response){
    response.render('index');
});

// Server config
app.listen(3000, function(){
    console.log('App running on port 3000');
});
