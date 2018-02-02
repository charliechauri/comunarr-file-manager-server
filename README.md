# comunarr-file-manager-server

![Comunarr](https://static.wixstatic.com/media/338ed6_82a0ae1e055844fdb83495390e31c58c.jpg/v1/fill/w_320,h_192,al_c,q_80,usm_0.66_1.00_0.01/338ed6_82a0ae1e055844fdb83495390e31c58c.webp "Comunarr logo")

Rest API for comunarr file manager

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

#### Server API
* You need to have installed node's 6.9.5 version. We recommend you to use [nvm](https://github.com/creationix/nvm) for managing different node versions in MacOS/Linux. For Windows users there are two alternatives:
    * [nvm-windows](https://github.com/coreybutler/nvm-windows)
    * [nodist](https://github.com/marcelklehr/nodist)

#### Database Server
* Is necessary to have a mysql server, to create the db, run the ```src/database/comunarr_db.sql``` into your sql client's editor

## Installing
```
npm install
```

## Debugging
It is preferred to run the project on [VSCode](https://code.visualstudio.com/) to use the default project's config. Enter to debug section and run "nodemon".

![Comunarr](./run.gif "Comunarr logo")


## Deployment

Install project dependencies

```
npm install
```

Start application with the following command, specify the correct environment variables:
```
DATABASE_HOST={x.x.x.x} DATABASE_USER={user} DATABASE_PASSWORD={pass} DATABASE_SCHEMA={db_name} FILES_DIRECTORY={files_directory_name} TEMP_FILES_DIRECTORY={temp-files-directory-name} node app.js
```

Where:

* DATABASE_HOST is the host where the database has been installed
* DATABASE_USER is the database user that connect to the database and
* DATABASE_PASSWORD corresponds to that user
* DATABASE_SCHEMA is the name of the database. The default is named ```comunarr```, you can change this
* FILES_DIRECTORY is the name of the directory where the files are storage and
* TEMP_FILES_DIRECTORY is the name of the directory where are placed before saving them, by default, both directories are created in the project as ```files``` and ```temp_files```

It is recommended to create an ```.env``` file to place all this variables in the root of this project

The frontend application is located as a dependency in this project, you can set a method to serve it from here or deploy in any other web server

## Login 

Default application root user:

User: ***comunarr***
password: ***comunarr***

## Built with 💚 and the following excellent projects:
* [Hapi.js](https://hapijs.com/) - Web framework
* [mysql](https://github.com/mysqljs/mysql) - Mysql client for node js


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
