# h2-tracker

Second Tematic Project for University, a Desktop health tracking program made with Serverpod and Flutter, both in Dart, and PostgreSQL as the database.

Team
  - Juan Carllo Pereira Ribeiro
  - Kvarzsiev  
  - William Tomazini Becker

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

### Generating Code (to run after changes in endpoints or models on the server directory)

```
$ cd h2_tracker/h2_tracker_server
$ serverpod generate
```
