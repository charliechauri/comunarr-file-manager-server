# comunarr-file-manager-server

![Comunarr](https://static.wixstatic.com/media/338ed6_82a0ae1e055844fdb83495390e31c58c.jpg/v1/fill/w_320,h_192,al_c,q_80,usm_0.66_1.00_0.01/338ed6_82a0ae1e055844fdb83495390e31c58c.webp "Comunarr logo")

Rest API for comunarr file manager

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* You need to have installed node's 6.9.5 version. We recommend you to use [nvm](https://github.com/creationix/nvm) for managing different node versions in MacOS. For Windows users there are two alternatives:
    * [nvm-windows](https://github.com/coreybutler/nvm-windows)
    * [nodist](https://github.com/marcelklehr/nodist)
* Is necessary to have a mysql server, to create the db, run the ```src/database/comunarr_db.sql``` into your sql client's editor

## Installing
```
npm install
```

## Running
It is preferred to run the project on [VSCode](https://code.visualstudio.com/) to use the default project's config. Enter to debug section and run "nodemon".

![Comunarr](./run.gif "Comunarr logo")


## Deploy

```
// Update project dependencies
npm install

// Start application with the following command, specify the correct parameters
DATABASE_HOST={x.x.x.x} DATABASE_USER={user} DATABASE_PASSWORD={pass} DATABASE_SCHEMA={db_name} FILES_DIRECTORY={files_directory_name} TEMP_FILES_DIRECTORY={temp-files-directory-name} node app.js

```

## @TODO
* Catalogs
  * Date filters (1900-01-01 = undefined date)
* Add Google Analytics - @charliechauri
* Add size calculator

## Built with 💚 and the following excellent projects:
* [Hapi.js](https://hapijs.com/) - Web framework
* [mysql](https://github.com/mysqljs/mysql) - Mysql client for node js

## Authors

* **Ariana Hernández** - *Initial work* - [ariherna](https://github.com/ariherna)
* **Charli Echauri** - [charliechauri](https://github.com/charliechauri)
* **Óscar González** - [ozkrpp](https://github.com/ozkrpp)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
