const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

// pg
const { Pool } = require('pg');
var pool = null;
function connectPool() {
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Product',
        password: '123',
        port: 5432
    })
};

app.get('/read', function (req, res) {
    connectPool();
    pool.query(`select * from "Products"`, function (err, result) {
        console.log(result);
        res.json(result.rows);
    });
    pool.end();
});

// check username
app.post('/readuser', function (req, res) {
    connectPool();
    const { username } = req.body
    const qr = `select * from "Account" where "USERNAME" = '${username}'`
    pool.query(qr, function (err, result) {
        res.json({ result: true, message: "Dang nhap thanh cong" })
    });
    pool.end();
});

app.post('/login', function(req, res) {
    connectPool();
    const { username, password } = req.body
    const qr = `select * from "Account" where "USERNAME" = '${username}' and "PASSWORD" = MD5('${password}')`
    console.log({qr});
    pool.query(qr, function (err, result) {
        res.json({ result: true, message: "Dang nhap thanh cong" })
    });
    pool.end();
});

app.post('/add', function (req, res) {
    connectPool();
    const { username, password, phonenumber, fullname } = req.body;
    const qr1 = `select * from "Account" where "USERNAME" = '${username}'`;
    pool.query(qr1, function (err1, result1) {
        if (result1.rowCount != 0) {
            res.json({ result: false, message: "Ten dang nhap ton tai"});
        } else if (password != "") {
            connectPool();
            const qr = `insert into "Account" ("USERNAME", "PASSWORD", "PHONENUMBER", "FULLNAME")
            values ('${username}',MD5('${password}'),'${phonenumber}', '${fullname}')`;
            console.log(qr);
            pool.query(qr, function (err2, result2) {
                console.log(result2);
                res.json({ result: true, message: "Dang ky thanh cong"});
            });
            pool.end();
        }
    });
    pool.end();
});

app.post('/delete', function (req, res) {
    connectPool();
    const { id } = req.body;
    const qr = `delete from "Products" where "ID" = '${id}'`;
    console.log(qr);
    pool.query(qr, function (err, result) {
        console.log(result);
        res.json({ res: result.rowCount })
    });
    pool.end();
});

app.listen(3000);