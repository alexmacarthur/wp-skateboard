# WP Skateboard
A bare-bones starter WordPress environment using Docker and Composer. Right now, this just quickly sets up a functional local environment and does not include any starter theme, although [there is a branch](https://github.com/alexmacarthur/wp-skateboard/tree/starter-theme-underscores) that illustrates how you might use Composer to install one.

## How to Stand This Up
Make sure [Docker](https://www.docker.com/), [Docker Compose](https://docs.docker.com/compose/), and [Composer](https://getcomposer.org/) are installed on your machine. 

1. Run `make up`. If it's the first time being run, this will build a `wp-skateboard` Docker image. After this, the container will be turned on, which will be accessible at `http://localhost:8000`. The `wp-content` directory is where you'll want to put the themes and plugins you're developing. After this initial build, turning on the container in the future will be much quicker.
2. Optionally run `make prep`. This will remove plugins, themes, and database content that come with a default WordPress installation.
3. Optionally run `composer install`. This will install any dependencies you have set in your `composer.json` file. 
4. When you're done, run `make down` to turn off the container.

There are some other commands in the `Makefile` too, so feel free to check those out or add your own.

## Connect to SQL Database
You can use a tool like [Sequel Pro](https://www.sequelpro.com/) to more easily see what's happening inside your database. To connect, use the following configuration: 

**Host:** 127.0.0.1  
**Username:** root  
**Password:** root  
**Port:** 3306  

## Want to Tinker w/ WordPress Core?
Out of the box, the WordPress core files will only exist inside the running container, with no _easy_ access to modify them if you want to play around or troubleshoot. To give yourself the core files with which to tinker, run the `make localize` command while your container is running to install the files locally, mount them to your container, and modify your WordPress configuration so the site uses these files instead of what's built by the image. 

After running this command, run `make down` to turn off your container, and uncomment the `- ./core:/var/www/html/core` line in the `docker-compose.yml` file to mount that directory to the container. Run `make up` to get it going again. Any changes you make to core files should appear in the browser. 

Now, to access this new WP admin location, navigate to `localhost:8000/core/wp-admin`. 

## License
MIT © [Alex MacArthur](https://macarthur.me)