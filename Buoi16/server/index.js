const express = require('express');
const app = express();

var arrHocVien = [
    new HocVien('Teo Nguyen', 1999),
    new HocVien('Ti Tran', 1997)
]

app.get('/hocvien', function(req, res){
    res.send(arrHocVien);
});

app.get('/hocvien/:admin', function(req, res){
    var admin = req.params.admin
    if (admin == 'khoapham') {
        res.send(arrHocVien);
    } else {
        res.send('Ban khong duoc quyen truy cap');
    }
});

app.get('/ios', function(req, res){
    res.send('IOS');
});

app.get('/android', function(req, res){
    res.send('ANDROID');
});

app.listen(3000);

function HocVien(hoten, namsinh){
    this.HOTEN = hoten;
    this.NAMSINH = namsinh;
};