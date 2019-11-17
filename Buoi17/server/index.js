const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

var arrHocSinh = [
    new HocSinh('Teo Nguyen', 1999, 'Nam'),
    new HocSinh('Hoa Nguyen', 1997, 'Nu'),
    new HocSinh('Tun Pham', 2000, 'Nam'),
]

app.get('/hocsinh', function(req,res){
    res.send(arrHocSinh);
});

app.post('/hocsinh', function(req,res){
    var hoten = req.body.HOTEN;
    var namsinh = req.body.NAMSINH;
    console.log(namsinh);
    var gioitinh = req.body.GIOITINH;
    var hocsinh = new HocSinh(hoten, 1991, gioitinh);
    console.log(hocsinh);
    arrHocSinh.push(hocsinh);
    res.send(arrHocSinh);
});

app.listen(3000);

function HocSinh(hoten, namsinh, gioitinh){
    this.HOTEN = hoten;
    this.NAMSINH = namsinh;
    this.GIOITINH = gioitinh;
};