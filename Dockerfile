FROM golang:1.10.0-stretch as BUILD

ENV DEBIAN_FRONTED noninteractive

RUN apt update

RUN go get -v github.com/rubenv/sql-migrate/...

RUN mkdir -p /files

ENV CONFIG ""

ADD run.sh /bin/run.sh

ENTRYPOINT ["/bin/run.sh"]

CMD ["status"]