# WP Skateboard
A bare-bones starter WordPress environment using Docker. Right now, this just quickly sets up a functional local PHP environment and WordPress installation. Out of the box, the container comes installed with tools like Composer and the WP CLI. 

## How to Stand This Up
Make sure [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) are installed on your machine.

1. Clone this repository into a directory. 
2. Navigate into that directory. 
3. Run `docker-compose up` to turn on the container. 
4. If this is your first time using this environment, run `sh setup.sh` (outside the running container -- no need to enter it). This will do the following things to get set up:
* Download & install WordPress.
* Enable WP debugging.
* Remove default posts, comments, and terms. 
* Remove default plugins, themes, widgets. 
* Install any dependencies you have noted in your `content/composer.json` file. 
5. After setup, navigate to http://localhost/wp-admin, where you'll be able to login with `admin` and `password` as the username & password. 
6. In the future, just turn on the container by running `docker-compose up`. This will turn on the container and make the `/wordpress` directory the web root, with the `content` directory being mounted inside of that. **You should do all of your local development (themes, plugins, etc.) inside the `content` directory at the root of this project.**
7. When you're done, run `docker-compose down` to turn off the container.

There are some other commands in the `Makefile` too, so feel free to check those out or add your own.

## Composer for Dependency Management
Composer is installed inside the container for easier dependency management, and a `composer.json` file is included in the `wp-content`. These are automatically installed on setup, but you can also install/update them manually using the following command: 

```
docker-compose exec --user root php-fpm /bin/bash -c "cd wp-content && composer install"
```

Or, to update packages, use: 

```
docker-compose exec --user root php-fpm /bin/bash -c "cd wp-content && composer update"
```

## Mailcatcher
Mailcatcher is setup to trap emails sent from your application. View these emails by going to [http://localhost:1080/](http://localhost:1080/).

## Connect to SQL Database
You can use a tool like [Sequel Pro](https://www.sequelpro.com/) to more easily see what's happening inside your database. To connect, use the following configuration: 

**Host:** 127.0.0.1  
**Username:** root  
**Password:** root  
**Port:** 3306  

## Other Questions

### Where do I put my projects?
Everything should go in the `content` directory, which will be mounted to the container when it's turned on. 

### How do I modify the WordPress configuration?
Right now, directory modify the `wp-config.php` file in the `wordpress` directory. 

### How do I navigate the file system of the running container? 
Run `docker-compose exec --user root php-fpm /bin/bash`, or use the `make bash` shortcut (assuming `make` is installed).

### Can I change the server configuration?
Yes. In the `config` directory, a `default.conf` and `php.ini` file exist for you to customize nginx & PHP as needed. These are mounted to the container when you turn it on.

### How do I change the version of PHP?
In the `docker-compose.yml` file, change the tag in this line: `image: 10up/phpfpm:7.2`. You can [see a list of available tags here.](https://hub.docker.com/r/10up/phpfpm/tags)

## Thanks
This environment was heavily inspired by [10up](https://github.com/10up) and their [wp-local-docker](https://github.com/10up/wp-local-docker) project. So, thanks to them.

## License
MIT © [Alex MacArthur](https://macarthur.me)
