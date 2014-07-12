FROM ubuntu:latest
MAINTAINER Mohamed F. Ahmed <moh.f.ahmed@gmail.com>


# Adding Mercurial repository
RUN echo 'deb http://ppa.launchpad.net/mercurial-ppa/releases/ubuntu precise main' > /etc/apt/sources.list.d/mercurial.list
RUN echo 'deb-src http://ppa.launchpad.net/mercurial-ppa/releases/ubuntu precise main' >> /etc/apt/sources.list.d/mercurial.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 323293EE

# Installing GoLang Dependencies
RUN apt-get update
RUN apt-get install -y curl git bzr mercurial

# Installing Go
RUN curl -s https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar -v -C /usr/local/ -xz

# Setting Go env vars
ENV PATH  /usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
ENV GOPATH  /go
ENV GOROOT  /usr/local/go

# getting Go source code
RUN go get github.com/MohamedFAhmed/GoLang-Hello-World

# Adding source files to the directory
WORKDIR /go/src/github.com/MohamedFAhmed/GoLang-Hello-World
ADD . /go/src/github.com/MohamedFAhmed/GoLang-Hello-World

# Fetch new dependencies if any
RUN go get

# Install application
RUN go build

# Set entrypoint
ENTRYPOINT ./GoLang-Hello-World
