# h2-tracker

My Second Tematic Project for University

## Installing

- Install Flutter 3.24.2
- Install Serverpod

```
$ dart pub global activate serverpod_cli
```

## Running

### Starting the server

Make sure that Docker Desktop is running, then start your Docker containers with docker compose up --build --detach. It will start Postgres and Redis. Then, run dart bin/main.dart --apply-migrations to start your server.

```
$ cd h2_tracker/h2_tracker_server
$ docker compose up --build --detach
$ dart bin/main.dart --apply-migrations
```

### Starting the application

```
$ cd h2_tracker/h2_tracker_flutter
$ flutter run
```

## Coding

### Generating Code (run after changes in endpoints or models on the server directory)

```
$ cd mypod/mypod_server
$ serverpod generate
```
