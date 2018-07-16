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

### Shortcodes

#### Content Bits Shortcode

The content bits shortcode is included in a page or post with the following code:

```
[avorg-bits id=identifierString]
```

Identifiers could be `mediaSidebar`, `homeFooter`, `smallAds`, or any other string that makes sense as a way to 
tie the shortcode instance to a collection of content bits. The identifier may be unique, but it doesn't need to be.

Once you've placed the shortcode in a page or post, you'll need to create one or more pieces of content in the Content
Bits page in the admin interface that specify the previously-used id in the "Identifier" meta box.

- If there are no pieces of content that are associated with the used identifier, the shortcode will output nothing.
- If there is one or more piece of content associated with the identifier, one will be chosen at random to be displayed.
- If there is a piece of content associated with the identifier and also associated with one or more media IDs, a
  content bits shortcode using that identifier on the page for one of those media items will display one of the pieces
  of content explicitly associated with both that media item's ID and the shortcode identifier.

#### List Shortcode

Place the following usages in the content of a page or a post to retrieve a list of rent, featured, or popular 
presentations.

Usage                        | Result
-----------------------------|--------------------------------
`[avorg-list]`               | List of recent presentations
`[avorg-list list=featured]` | List of featured presentations
`[avorg-list list=popular]`  | List of popular presentations

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
