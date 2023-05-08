<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
### Table of Contents
- [Overview:](#overview)
    * [Installation on Linux:](#installation-on-linux)
- [Usage:](#usage)
    * [Check connectivity on a port:](#check-connectivity-on-a-port)
    * [Start a server and a client:](#start-a-server-and-a-client)
    * [Running a simple webserver:](#running-a-simple-webserver)

<!-- TOC end -->

<!-- TOC --><a name="overview"></a>
### Overview:
netcat (often abbreviated to nc) is a computer networking utility for reading from and writing to
network connections using TCP or UDP. [Wikipedia](https://en.wikipedia.org/wiki/Netcat).

<!-- TOC --><a name="installation-on-linux"></a>
#### Installation on Linux:
```shell
apt-get install -y netcat
```

<!-- TOC --><a name="usage"></a>
### Usage:

Usage format: `nc [args] <host> <port>`

<!-- TOC --><a name="check-connectivity-on-a-port"></a>
#### Check connectivity on a port:
```shell
$ nc -vz google.com 443
## Connection to google.com port 443 [tcp/https] succeeded!
```
1. `-v` For verbose output.
2. `-z` Specifies that nc should just scan for listening daemons, without sending any data to them.

<!-- TOC --><a name="start-a-server-and-a-client"></a>
#### Start a server and a client:
*Server:*
```shell
$ nc -lv <port>
```
`-l` tells netcat to listen on port <port>.

*Client:*
```shell
nc -v localhost <port>
```

By default, the server & client processes will return once the connection is terminated.
In order to keep the server alive forever, use `-k` flag.

<!-- TOC --><a name="running-a-simple-webserver"></a>
#### Running a simple webserver:
```shell
#!/usr/bin/env bash
while true; do 
  echo -e "HTTP/1.1 200 OK\n\n$(echo SUCCESS)" | nc -l 1234; 
done
```
Connect to the webserver using:
```shell
$ nc -v localhost 1234
$ curl localhost:1234
```

For more argument options, refer nc [manpage](https://linux.die.net/man/1/nc).

More use-cases for `netcat`:
1. Reverse shell. [Reference](https://www.baeldung.com/linux/netcat-command#3-reverse-shell-using-netcat).
2. Reverse Proxy. [Reference](https://www.baeldung.com/linux/netcat-command#reverse-proxy-with-netcat).