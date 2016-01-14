# genexies/docker-nginx-proxy

  Example:
  ```
  docker run --name=nginx-proxy --publish=10005:80 --link=war-tomcat8:war-tomcat8-link --env=PROXY_PASS=http://war-tomcat8:8080 --detach=true nginx-proxy
  ```
