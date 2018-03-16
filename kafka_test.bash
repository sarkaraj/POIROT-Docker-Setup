# :: KAFKA TOPICS ::

# TESTING
docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_PORT=9092 spotify/kafka

docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=myvm1 --env ADVERTISED_PORT=9092 spotify/kafka

# Running kafka broker
docker run -d -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=kafka --hostname kafka --env ADVERTISED_PORT=9092 --name kafka-broker-service spotify/kafka

# creating a topic
docker exec kafka-broker-service /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

# testing

docker exec kafka-broker-service /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --list --zookeeper localhost:2181

# testing with a producer
docker run -it --rm --link kafka-broker-service spotify/kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic test

# testing with a consumer
docker run -it --rm --link kafka-broker-service spotify/kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning

