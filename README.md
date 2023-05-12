# Metrics

This repo holds a deployment for
[prometheus](https://prometheus.io/docs/introduction/overview/),[grafana](https://grafana.com/),
and [alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/).

It's needs and configuration are specific to the planetary org, and so do not
recommend using this if you are outside the organization.

# Structure

The three services are defined in the root `docker-compose.yml` file.  

`/configs` holds the configuration files for the services, with each service
given its own subdirectory.

`/builds` holds Dockerfiles for creating custom images for these services, if
needed. At the moment, we only do this for alertmanager so we can pass in env
vars that it doesn't natively support.

The compose file expects two files that, since they contain secrets, are not
included in this repo: `.env.grafana` and `env.alertmanager`. There are
templates included for each file that you can use to build your own version.

# Deploying locally

To try this out, you will need [docker](https://docker.com) installed.

Clone down this repo and enter it:

``` sh
git clone https://github.com/planetary-social/metrics.git
cd metrics
```

create the necessary .env files:

``` sh
cp env.alertmanager.template .env.alertmanager
cp env.grafana.template .env.grafana
```

Customize these two files for your own use, then start it all with docker-compose:

``` sh
docker-compose up --build 
```

Once up, you'll have three services youc an visit in your browser: 

- prometheus at localhost:9090
- grafana at localhost:3000
- alertmanager at localhost:9093

# Deploying in Production

This is the same procedure as deploying locally.  This is best run behind a proxy like [nginx](https://nginx.org).  
The setting up of the proxy is not a part of this repo or the deployment.



