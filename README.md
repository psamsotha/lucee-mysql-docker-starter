
# Docker Lucee MySQL REST Starter

A simple starter project using Lucee MySQL Docker and REST

### MySQL

* Version 5.7
* Root password is `secret`. To change it, change the `db.environments.MYSQL_ROOT_PASSWORD`
  in the `docker-compose.yml` file.


### Lucee

* Version 5.2
* All the file in the `docker` folder are copied from 5.2 folder of the [lucee-dockerfiles][lucee-github] 
  repository.
* In the `Application.cfc`, you will need to modify the dataSource connectionString. Most likely the host,
  as well as the password if you change it in the `docker-compose.yml`.

### Run

You will need to have [Docker Compose][docker-compose] installed. Once it is installed, just run

```
docker-compose up
```

If this is your first time running this, docker will download the Lucee and MySQL images. Then
both Lucee server and MySQL server will startup in separate containers.

At this point (until I learn more and figure out otherwise), one more manyual configuration will
need to be done to set up the REST API. Go to the admin web console and type in a new password to login.

```
http://<host>:8052/lucee/admin/web.cfm
```

To to Archive&Resources -> Rest and at the bottom at "Create New Mapping", type in `/api` for the
Virtual and `/var/www` for the Physical and then save.

### Test

If you have cURL installed (or whaterever REST client you prefer), run the following command
to create a person in the database

```
curl -i -d '{"firstName":"Bart", "lastName":"Simpson"}' \
     -H 'Content-Type:application/json' \
     http://<host>:8052/rest/api/persons
```

You should get back the following response with the created id.

```
{"id":1,"firstName":"Bart","lastName":"Simpson"}
```

Then check that it was saved

```
curl -i http://<host>:8052/rest/api/persons/1
```


### TODO

* Figure out how to put the resource and model compoents into their own directory. Right now, trying
  to move the into their own director, say `resources`, and chaging the mapping in the admin console
  from `/var/www` to `/var/www/resources` causes an error "ORM is not enabled". Wierd.
* Is it possible to accept an entity component as a method parameter for the POST, instead of
  using a struct like we are doing.
*



[lucee-github]: https://github.com/lucee/lucee-dockerfiles
[docker-compose]: https://docs.docker.com/compose/