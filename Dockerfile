FROM alpine:3.6

ENV PGHOST='pgsql-container-backup.postgres.database.azure.com'
ENV PGDATABASE='postgres'
ENV PGUSER='pgsqladmin@pgsql-container-backup'
ENV PGPASSWORD='Passw0rd1'

RUN apk update
RUN apk add postgresql

COPY dumpDatabase.sh .

ENTRYPOINT [ "/bin/sh" ]
CMD [ "./dumpDatabase.sh" ]