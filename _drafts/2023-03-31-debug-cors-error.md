---
tags: api cors troubleshooting
resources:
  - https://httptoolkit.com/blog/how-to-debug-cors-errors/
---

```bash
curl 'http://localhost:8080/users/2200206' \
  -X 'OPTIONS' \
  -H 'authority: dev-api.3rdmil.com' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'access-control-request-headers: access-token,authorization' \
  -H 'access-control-request-method: GET' \
  -H 'origin: https://dev-account.3rdmil.com' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H 'cookie: XDEBUG_SESSION' \
  --compressed \
  -i
```
