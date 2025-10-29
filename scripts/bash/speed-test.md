
### Speed(download) test via curl
```sh
# downloads 100MB from cloudflare
curl -o /dev/null -w "Speed: %{speed_download} bytes/sec\n" "https://speed.cloudflare.com/__down?bytes=1e8"
```
