# This Dockerfile is used to make containers to build go projects.
FROM segment/docker:latest

# install go
RUN curl -s -L https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz > /tmp/go.tar.gz && \
    cd /usr/local && \
    tar -xzf /tmp/go.tar.gz && \
    rm -f /tmp/go.tar.gz && \
    mkdir /go

# configure the go environment
ENV GOROOT=/usr/local/go GOPATH=/go PATH=$PATH:/usr/local/go/bin

# configure the container's entry point
COPY files/Makefile.golang /usr/src/Makefile.golang
ENTRYPOINT ["make", "-f", "/usr/src/Makefile.golang"]
