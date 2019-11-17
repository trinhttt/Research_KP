const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

// jwt
const jwt = require('jsonwebtoken');
const secret = 'khoapham.vn';

app.get('/createToken', function(req, res){
    // create
    const token = jwt.sign({
        name: "teo nguyen",
        age: 18
    },secret,{expiresIn: 600});
    res.json({token: token});
});

app.post('/check_token', function(req, res){
    const token = req.body.token;
    jwt.verify(token,secret, function(err, decoded){
        req.decoded = decoded;
        res.json({name: decoded.name, age: decoded.age});
    });
});

app.listen(3000);
