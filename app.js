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
const { Console } = require('console');
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

// Session config
app.use(expressSession({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

// BodyParser Middleware config
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/login', function(request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
        pool.connect(function(err, client, done)  {
            if(err) {
                return console.error('Connection error has occured', err);
            }
            client.query('SELECT * FROM public.users WHERE username = $1 AND password = $2', [username, password], function(error, result) {
                if (result.rowCount > 0) {
                    request.session.loggedin = true;
                    request.session.username = username;
                    request.session.isModerator = result.rows[0].isModerator;
                    // console.log('Is Moderator ? ' + request.session.isModerator);
                    response.redirect('/');
                } else {
                    console.log('Incorrect Username and/or Password!');
                    response.redirect('/');
                }			
                done();
            }); 
        }); 
    } else {
		console.log('Please enter Username and Password!');
		response.redirect('/');
	}
});

app.post('/logout', function(request, response) {
    if (request.session.loggedin) {
        request.session.loggedin = false;
        request.session.isModerator = false;
        request.session.username = null;
        console.log('User has been logged out!');
        response.redirect('/');
    } else {
        console.error('User has been already logged out!')
    }
    response.end();
});

app.get('/', function(request, response){
    var filters = request.query; // Take parameters from query and removing default ones
    for (var key in filters) if (filters[key] === 'Any') delete filters[key];

    if (request.session.loggedin) {
        console.log('Welcome back, ' + request.session.username + '!')
    }
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('Connection error has occured', err);
        }
        // query for recipes
        client.query('SELECT * FROM public.recipes', function(err, result) {
        if(err) {
            return console.error('Error has occured when running a query', err);
        }
        // defining values for filters without duplicated values
        const types = [...new Set(result.rows.map(singleRow => { return singleRow['type'] }))];
        //const difficulties = [...new Set(result.rows.map(singleRow => { return singleRow['difficulty'] }))];
        const authors = [...new Set(result.rows.map(singleRow => { return singleRow['createdBy'] }))];
        // Filter db query results
        const filteredResults = result.rows.filter(recipe => { 
            let isValid = true;
            for (key in filters) {
                isValid = isValid && recipe[key] == filters[key];
            }
            return isValid;
        });
        response.render('index', {
            recipes: filteredResults, user: request.session.loggedin, isModerator: request.session.isModerator,
            types: types, authors: authors
        });
        done();
        });
    })
});

app.post('/add', function(request, response) {
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('Connection error has occured', err);
        }
        client.query('INSERT INTO public.recipes(' + 
            'name, type, "preparationTime", difficulty, ingredients, description, "photoUrl", "createdBy")' + 
            'VALUES($1, $2, $3, $4, $5, $6, $7, $8)', [
                request.body.name, request.body.type, request.body.preparationTime, request.body.difficulty, request.body.ingredients, 
                request.body.description, 'https://www.glamour.pl/media/cache/default_view/uploads/media/quiz/0004/97/quiz-ktora-atomowka-jestes.jpeg', request.session.username
            ]);
            done();
            response.redirect('/')
    })
});

app.delete('/delete/:id', function(request, response) {
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('Connection error has occured', err);
        }
        client.query('DELETE FROM public.recipes WHERE id = $1', [request.params.id]);
            done();
            response.sendStatus(200)
    })
});

app.post('/edit', function(request, response) {
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('Connection error has occured', err);
        }
        client.query('UPDATE public.recipes SET ' + 
            'name = $1, type = $2, "preparationTime" = $3, difficulty = $4, ingredients = $5, description = $6, "photoUrl" = $7' + 
            'WHERE id = $8', [request.body.name, request.body.type, request.body.preparationTime, request.body.difficulty, 
                request.body.ingredients, request.body.description, request.body.photoUrl, request.body.id
            ]);
            done();
            response.redirect('/');
    });
});

function isEmpty(str) {
    return (!str || str.length === 0);
}

// Server config
app.listen(3000, function(){
    console.log('App running on port 3000');
});
