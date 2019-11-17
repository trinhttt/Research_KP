const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

// pg
const {Pool} = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Product',
    password: '123',
    port: 5432
})

app.get('/get', function(req,res){
    pool.query(`select * from "Products"`, function(err, result){
        console.log(result);
        res.json(result.rows);
    });
    pool.end();
});

app.post('/post', function(req,res){
    const {price, name, description} = req.body;
    const qr = `insert into "Products" ("NAME", "PRICE", "DESCRIPTION")
    values ('${name}',${price},'${description}')`;
    console.log(qr);
    pool.query(qr, function(err, result){
        console.log(result);
        res.json({kq:result.rowCount})
    });
    pool.end();
});

app.listen(3000);