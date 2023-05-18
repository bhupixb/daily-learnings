### Inspect incoming HTTP requests:
A great way to inspect incoming HTTP requests including headers and query parameters is to sniff the network traffic on the port where service is running. 
For instance on a development server bound to port 3000 on localhost, run this:

```shell
# sudo access is necessary for watching the network
sudo ngrep -d lo0 port 3000
```

