const { execPath } = require('process');

// Import packages
var express = require('express'),
    expressSession = require('express-session'),
    path = require('path'),
    bodyParser = require('body-parser'),
    cons = require('consolidate'),
    dust = require('dustjs-helpers'),
    app = express();

// Db Config
const pg = require('pg');
const pool = new pg.Pool({
        host: 'localhost',
        database: 'recipebook_db',
        user: 'recipebook_user',
        password: 'Passw0rd!'
    });

// Views config
app.engine('dust', cons.dust);
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

// Define Public directory
app.use(express.static(path.join(__dirname, 'public')));

// BodyParser Middleware config
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', function(request, response){
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('Connection error has occured', err);
        }
        client.query('SELECT * FROM public.recipes', function(err, result) {
        if(err) {
            return console.error('Error has occured when running a query', err);
        }
        response.render('index', {recipes: result.rows});
        done();
        });
    })
});

app.post('/add', function(request, response) {

});

// Server config
app.listen(3000, function(){
    console.log('App running on port 3000');
});
