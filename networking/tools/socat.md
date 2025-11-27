[Socat]([url](https://linux.die.net/man/1/socat))

### Listen on a Port:

Can be useful, if you want to test what all headers, request body etc an HTTP client is sending.

```bash
# start listeing on 8080
$ socat TCP4-LISTEN:8080 STDOUT

# hit this port e.g. below
$ curl localhost:8080

# the output on socat side will be:
GET / HTTP/1.1
Host: localhost:8080
User-Agent: curl/8.7.1
Accept: */*
```

### TCP port forwarding for HTTP traffic

```bash
# Forward all traffic on localhost:8080 to 10.5.64.37:9000
$ socat TCP4-LISTEN:8080,fork,reuseaddr TCP4:10.5.64.37:9000
```
