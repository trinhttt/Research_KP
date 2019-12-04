const express = require('express');
const app = express();
app.use(express.static('images'));

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// multer
const multer = require('multer');
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'images')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
});
function fileFilter(req, file, cb) {

    if (file.mimetype !== 'image/jpeg') {
        req.fileValidationError = 'goes wrong on the mimetype';
        return cb(null, false, new Error('goes wrong on the mimetype'));
    }
    cb(null, true);

};
const upload = multer({ storage: storage, fileFilter: fileFilter });

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

app.post('/single', upload.single('avatar'), function (req, res, next) {
    const avatar = req.file;
    res.send(avatar);
});

app.post('/array', upload.array('galery', 5), function (req, res, next) {
    const galery = req.files;
    galery.forEach(function(img){
        img.filename
    });
    res.json({ result: true, message: "Tai anh len thanh cong", code: res.statusCode, data: galery });
});

app.post('/login', function (req, res) {
    connectPool();
    const { username, password } = req.body
    const qr = `select * from "Account" where "USERNAME" = '${username}' and "PASSWORD" = MD5('${password}')`
    pool.query(qr, function (err, result) {
        res.json({ result: true, message: "Dang nhap thanh cong", code: res.statusCode })
    });
    pool.end();
});

app.listen(3000);