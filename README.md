# sinatra-unicorn
Sinatra * Unicorn * Capistrano

- Port 58080
  - pure sinatra
- Port 58081
  - unicorn sinatra

## Installation

```
$ git clone git@github.com:a4t/sinatra-unicorn.git
```

## Usage
### Build

```
$ docker-compose build
```

### Deploy

```
$ docker-compose up -d
$ curl localhost:58080
Hello!!<br />Deploy time is 2017-06-15 09:35:56
$ curl localhost:58081
<html>
<head><title>502 Bad Gateway</title></head>
<body bgcolor="white">
<center><h1>502 Bad Gateway</h1></center>
<hr><center>nginx/1.13.0</center>
</body>
</html>
```

### Unicorn deploy

- Local file copy deploy

```
$ docker-compose run deploy bundle exec cap docker-copy deploy
$ curl localhost:58081
Hello!!<br />Deploy time is 2017-06-15 09:39:49
```

- Github deploy
```
$ docker-compose run deploy bundle exec cap docker-git deploy
$ curl localhost:58081
Hello!!<br />Deploy time is 2017-06-15 09:40:16
```
