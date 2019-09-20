# kafka-connect-demo

Demonstration of Kafka Connect Couchbase.

## Prerequisites

* Docker
* curl 

## Set up Couchbase Server

1. Start the Couchbase Docker container:

       ./setup-couchbase.sh

2. Visit http://localhost:8091/ and configure the cluster with username `Administrator` and password `password`.
Optional: allocate 1024 MB to the Data service and disable all other services.

3. In the Couchbase web UI, go to the "Buckets" section and follow the link to add sample buckets. Add the `travel-sample` bucket.

4. Return to the "Buckets" section and add two more buckets, `dest` and `dest-routes`.
Reduce the memory quota to 100 MB. Enable "Flush" in the "Advanced Settings" section.

## Set up Kafka

1. Start the Kafka containers:

       ./setup-kafka.sh

It takes a while for the containers to really finish starting up. In the mean time...

## Set up connect-cli tool

1. Download and build the `connect-cli` tool:

       ./setup-connect-cli.sh
       
2. Add the tool to your PATH environment variable:

       export PATH=$(pwd)/tmp/kafka-connect-tools/bin:${PATH}


## Clean up

When you're done with the demo, remove the Docker containers:

    ./cleanup.sh
