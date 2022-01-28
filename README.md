
# Setup the environment to laravel 8.x + Mysql 5.7 + Nginx 1.19

- To initialize the environment just follow these steps below
	- After clone this repository
        ```bash
        $ cd ambiente-laravel
        $ mkdir src
    - Copy the laravel project to the src folder
	- Make sure the environment config into the mysql service in the 'docker-compose.yml' is equal to the .env.example of the laravel project.
        - example:
            ```yml
            environment: 
                MYSQL_DATABASE: db
                MYSQL_ROOT_PASSWORD: 123456
                MYSQL_PASSWORD: 123456
                MYSQL_USER: laravel8
                SERVICE_TAGS: dev
                SERVICE_NAME: mysql
    - Remember to change the value of 'DB_HOST' in the '.env.example' into laravel project to 'mysql'
        - example:
            ```env
            DB_CONNECTION=mysql
            DB_HOST=mysql
            DB_PORT=3306
            DB_DATABASE=laravel8
            DB_USERNAME=laravel8
            DB_PASSWORD=123456
	- Into the 'ambiente-laravel' folder, run these commands
		```bash
        $ docker-compose build app
		$ docker-compose up
		$ docker-compose exec app bash
	 - In the command line into the app container, execute
        ```bash
		$ ../start.sh
		$ exit
	- Go to "http://localhos:8100" and have a fun.