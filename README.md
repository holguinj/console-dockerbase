# console-dockerbase image

Sets up a Postgres database ready to run console services tests.
That includes installing/creating all the necessary extensions, databases, and users.

## building the image

Clone this repository, then run the following command in it:

```
docker build -t console-dockerbase .
```

## running the image

I strongly recommend disabling any other instances of postgres that are listening on port 5432 (the default).
For ease of use, you'll want the dockerized version to be listening on that port instead.

```
docker run -d -p 5432:5432 --restart=always --name pg console-dockerbase
```

If you don't want to use port 5432, run this command **instead**:

```
docker run -d -P --restart=always --name pg console-dockerbase
```

Note that you'll have to find out what port Docker has chosen to forward (`docker port pg`) and supply it below where `5432` appears.

## configuring services to connect to the dockerized database

```shell
export CLASSIFIER_DBSUBNAME="//127.0.0.1:5432/pe-classifier"
export ACTIVITY_DBNAME="//127.0.0.1:5432/activity_test"
export RBAC_DBNAME="//127.0.0.1:5432/perbac"
```

## stopping the container when you're done (optional)

If you like, you can turn off the running container with `docker stop pg`, then start it again later with `docker start pg`.
