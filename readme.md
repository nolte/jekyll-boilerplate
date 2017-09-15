# Simple Jekyll Example Project

 [![Build Status](https://travis-ci.org/nolte/jekyll-boilerplate.svg?branch=master)](https://travis-ci.org/nolte/jekyll-boilerplate)

 develop version on https://noltarium-blog-test.herokuapp.com/   
 master version on https://nolte.github.io/jekyll-boilerplate   

[Slack](https://slack.com) Activity Channel: [#publicbuilds](https://noltarium.slack.com/messages/C156TTDD4/)

## Project Structure


```
.
├── ci_scripts (Travis Ci build util scripts)
├── docker_nginx (Dockerfile for the static Nginx version)
├── heroku_app (Additional files for running as Heroku App)
├── integration_test (Ruby Selenium Integration Tests for check the deployment)
├── jekyll_content (Jekyll Blog Structure)
├── Dockerfile (for Development)
├── docker-compose.yml (quick start the development env)
└── readme.md
```

## How To Start

The blog requires [Plantuml](http://plantuml.com/) & [Ditaa](http://ditaa.sourceforge.net/) in the path to generate the content.

### Local Development

```
cd ./jekyll_content
bundle install
bundle exec jekyll serve
```

### Docker
 Docker are a simple solution for the needed dependencies, to build or present the Blog.

#### Docker for Development

Use [nolte/jekyll-build-env](https://hub.docker.com/r/nolte/jekyll-build-env) as base image.

For develop in a preconfigured docker container use the docker compose file.

```
docker-compose up --build
```

Open http://localhost:4000 in your Browser. The container use ```./jekyll_content``` as volume, the container regenerate the content on the fly. The generated content are baned to the volume ```jekyllgeneratedcontent```.

#### Docker for Presentation


[Nginx Container](https://hub.docker.com/r/nolte/jekyll-boilerplate)

```
  docker run -p 8080:80 nolte/jekyll-boilerplate
```
