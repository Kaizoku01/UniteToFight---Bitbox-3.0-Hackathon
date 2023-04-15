const express = require('express');

// Security Middleware - To protect from attacks
const helmet = require('helmet');
const xss = require('xss-clean');
const mongoSanitize = require('express-mongo-sanitize');
const compression = require('compression');
const cors = require('cors');
//For Authentication
const passport = require('passport');

const httpStatus = require('http-status');
const config = require('./config/config');

//testing log
const morgan = require('./config/morgan');

const { jwtStrategy } = require('.config/passport');
const { authLimiter } = require('./middlewares/rateLimiter');

const routes = require('./routes/v1');

const ApiError = require('./utils/ApiError');

const app = express();

if (config.env !== 'test') {
  app.use(morgan.successHandler);
  app.use(morgan.errorHandler);
}

//set security HTTP headers
app.use(helmet());

// parse json request body
app.use(express.json());

// parse urlencoded request body
app.use(express.urlencoded({ extended: false }));

// sanitize request data
app.use(xss());
app.use(mongoSanitize());

//gzip compression
app.use(compression());

//enable cors
app.use(cors());
app.options('*', cors());

//jwt authentication
app.use(passport.initialize());
passport.use('jwt',jwtStrategy);

//limit repeated failed requests to auth endpoints
if(config.env == 'production') {
    app.use('/v1/auth', authLimiter);
}

// v1 api routes
app.use('/v1', routes);

//send back 404 error for any unknown api request
app.use((req,res,next) => {
    next(new ApiError(httpStatus.NOT_FOUND, "Not Found"));
});

//Converting the error to ApiError, if and when required
app.use(errorConverter);

//handle errors
app.use(errorHandler);

module.exports = app;