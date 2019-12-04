const express = require('express');
const app = express();

// socket.io
const server = require('http').Server(app);
const io = require('socket.io')(server);

io.on('connection', function(socket){
    console.log(socket.id + ' connected');
    socket.on('disconnect', function(){
        console.log('disconnected');
    });
    socket.on('client-send', function(data){
        console.log(data);
        io.emit('server-send', data);
        // socket.emit('tui-gui', data);
        // socket.broadcast.emit('nguoi-ta-gui', data);
        // socket.emit (gui lai cho nguoi gui)
        // socket.broadcast.emit (gui cho toan server ngoai tru nguoi gui)
    });
});

server.listen(3000);