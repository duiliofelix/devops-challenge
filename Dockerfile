FROM node:15 AS build

WORKDIR /build

COPY . .
RUN npm install && npm run build

FROM nginx

COPY --from=build /build/build/static /usr/share/nginx/html/static
COPY --from=build /build/build/* /usr/share/nginx/html
