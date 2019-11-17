const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

// pg
const {Pool} = require('pg');
var pool = null;
function connectPool(){
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Product',
        password: '123',
        port: 5432
    })
};

app.get('/read', function(req,res){
    connectPool();
    pool.query(`select * from "Products"`, function(err, result){
        console.log(result);
        res.json(result.rows);
    });
    pool.end();
});

app.post('/add', function(req,res){
    connectPool();
    const {price, name, description} = req.body;
    const qr = `insert into "Products" ("NAME", "PRICE", "DESCRIPTION")
    values ('${name}',${price},'${description}')`;
    console.log(qr);
    pool.query(qr, function(err, result){
        console.log(result);
        res.json({res:result.rowCount})
    });
    pool.end();
});

app.post('/delete', function(req,res){
    connectPool();
    const {id} = req.body;
    const qr = `delete from "Products" where "ID" = '${id}'`;
    console.log(qr);
    pool.query(qr, function(err, result){
        console.log(result);
        res.json({res:result.rowCount})
    });
    pool.end();
});

app.listen(3000);