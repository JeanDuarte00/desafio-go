FROM alpine:3.16

WORKDIR /usr/src/app

COPY app /usr/src/app/

RUN \
   wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz &&\
   tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz &&\
   export PATH=$PATH:/usr/local/go/bin &&\
   rm go1.17.2.linux-amd64.tar.gz

ENTRYPOINT [ "./printer" ]