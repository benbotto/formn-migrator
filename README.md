# formn-migrator

A Docker image for running migrations with
[Formn](https://github.com/benbotto/formn).  You'll need to set the following
environment variables to use the image.

* `MYSQL_HOST`
* `MYSQL_USER` (defaults to "root")
* `MYSQL_PASSWORD`
* `MYSQL_DATABASE`

Bind mount your `migrations` folder to `/migrations` in the container.  Example usage.

```
docker run \
  --rm \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=pass \
  -e MYSQL_HOST=db \
  -e MYSQL_DATABASE=my-db \
  -v `pwd`/migrations:/migrations \
  avejidah/formn-migrator:1.0.3
```

The command defaults to "up", but you can supply "up", "down", "run", or "create."
