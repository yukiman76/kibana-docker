
## Description
Cleaned up version of kibana with only core no need for xpath

it@github.com:yukiman76/kibana-docker.git
 
This WAS the official Kibana image created by Elastic Inc.

Documentation can be found on the [Elastic website](https://www.elastic.co/guide/en/kibana/current/docker.html).

Kibana is built with [X-Pack](https://www.elastic.co/guide/en/x-pack/current/index.html).


## Build instructions
    export DOCKER_ID_USER="jeffreyr"
    docker run --name jmr-kibana --privileged jmr-kibana
    docker exec -it jmr-kibana  bash
    docker tag jmr-kibana $DOCKER_ID_USER/jmr-kibana
    docker push $DOCKER_ID_USER/jmr-kibana
