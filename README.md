# wp-avorg-dev

## Installation

Install Docker, then:

```bash
chmod +x *.sh
docker-compose up
./setup.sh
open http://localhost:8000
```

## Usage

```bash
docker-compose up
open http://localhost:8000
```

[Home](http://localhost:8000)

[Admin login](http://localhost:8000/wp-login.php)

## Commands

### Host Commands

Command                                                                           | Description
----------------------------------------------------------------------------------|------------------------------------
`docker exec wp-avorg-dev_wordpress_1 /bin/bash -c 'cd /usr/src/wordpress && ls'` | Run command from outside container
`docker exec -it wp-avorg-dev_wordpress_1 bash`                                   | Jump into machine

### Any Docker Machine Commands

Command              | Description
---------------------|-------------------------------------
`prentenv`           | See all env vars, including Docker's
`ctrl+p+q` or `exit` | Jump out of machine

### WordPress Docker Machine Commands

Command          | Description
-----------------|----------------
`wp plugin list` | List plugins
