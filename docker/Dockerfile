FROM alpine

ARG AMQPTOOLS_VERSION


RUN apk add --no-cache --virtual .build-deps \
        curl \
    && apk add --no-cache \
        bash \
        jq \
    && cd /tmp \
    && curl -OSL https://github.com/subzerocloud/amqptools/releases/download/${AMQPTOOLS_VERSION}/amqpspawn-${AMQPTOOLS_VERSION}-alpine.tar.xz \
    && tar -xJvf amqpspawn-${AMQPTOOLS_VERSION}-alpine.tar.xz \
    && mv amqpspawn /usr/local/bin/amqpspawn \
    && curl -OSL https://github.com/subzerocloud/amqptools/releases/download/${AMQPTOOLS_VERSION}/amqpsend-${AMQPTOOLS_VERSION}-alpine.tar.xz \
    && tar -xJvf amqpsend-${AMQPTOOLS_VERSION}-alpine.tar.xz \
    && mv amqpsend /usr/local/bin/amqpsend \
    && rm -rf \
        amqpsend-${AMQPTOOLS_VERSION}-alpine.tar.xz \
        amqpspawn-${AMQPTOOLS_VERSION}-alpine.tar.xz \
    && apk del .build-deps

COPY onmessage.sh onmessage.sh
RUN chmod +x onmessage.sh

ENV EXCHANGE="amq.topic" \
    ROUTING_KEY="#" \
    PROGRAM="/onmessage.sh" \
    MAX_DELAY=30 

# other env vars controlling the behaviour
# AMQP_HOST
# AMQP_PORT
# AMQP_VHOST
# AMQP_USER
# AMQP_PASSWORD
# AMQP_QUEUE
# AMQP_QUEUE_PASSIVE
# AMQP_QUEUE_EXCLUSIVE
# AMQP_QUEUE_DURABLE


ENTRYPOINT amqpspawn --foreground -e $PROGRAM --max-delay $MAX_DELAY $EXCHANGE $ROUTING_KEY