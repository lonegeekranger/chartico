FROM nginx:1.27-alpine

# Cloud Run inyecta PORT; 8080 es el fallback local.
ENV PORT=8080

# El entrypoint de nginx:alpine expande ${PORT} sobre los templates al arrancar.
COPY deploy/nginx.conf.template /etc/nginx/templates/default.conf.template

# Se mantiene la misma estructura del repo para que las rutas
# relativas del front (`fetch("../data/...")`) sigan funcionando.
COPY src/ /usr/share/nginx/html/src/
COPY data/ /usr/share/nginx/html/data/

EXPOSE 8080
