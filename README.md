# comunarr-file-manager-server

Rest API for comunarr file manager

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* You need to have installed at least node's 6.9.5 and a mysql server
* Is necessary to have a mysql server, to create the db, run the ```src/database/comunarr_db.sql``` into your sql client's editor

## Installing
```
npm install
```

## Running
```
npm start 
```

## TODO
* Authentication - @charliechauri
* Upload file - @charliechauri
  * Extension always must be in minus
  * Files should not be .exe
* Download file - @charliechauri
* Specific search - @ariherna
  * Date filters (1900-01-01 = undefined date)
* Simple search - @ariherna
* Validate access to routes by user role - @charliechauri
* Catalogs
  * Validations - @charliechauri
  * Collective Comunarr Project - @ariherna
  * Specific topic - @ariherna
  * General topic - @ariherna
  * Specific topic general topic - @ariherna
  * Content type - @ariherna
  * File type - @ariherna
  * User - @ariherna
  * User type - @ariherna
  * Privacy type - @ariherna
  * Change password - @charliechauri
  * Keyword - @ariherna

## Built with 💚 and the following excellent projects:
* [Hapi.js](https://hapijs.com/) - Web framework
* [mysql](https://github.com/mysqljs/mysql) - Mysql client for node js

## Authors

* **Ariana Hernández** - *Initial work* - [ariherna](https://github.com/ariherna)
* **Charli Echauri** - [charliechauri](https://github.com/charliechauri)
* **Óscar González** - [ozkrpp](https://github.com/ozkrpp)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
