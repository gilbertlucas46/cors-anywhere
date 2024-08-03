require('dotenv').config(); // Load environment variables from .env file

// Listen on a specific host via the HOST environment variable
var host = process.env.HOST || '0.0.0.0';
// Listen on a specific port via the PORT environment variable
var port = process.env.PORT || 8888;

var cors_proxy = require('cors-anywhere');

// Read allowed IPs from environment variable and split into an array
var allowedIPs = process.env.ALLOWED_IPS ? process.env.ALLOWED_IPS.split(',') : [];

cors_proxy.createServer({
    originWhitelist: allowedIPs, // Allow only specified IP addresses
    requireHeader: ['origin', 'x-requested-with'],
    removeHeaders: ['cookie', 'cookie2']
}).listen(port, host, function() {
    console.log('Running CORS Anywhere on ' + host + ':' + port);
});
