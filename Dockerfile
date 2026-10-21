# Build the static site, then serve it with nginx.
# Node 22.22 or newer is required by Astro 7.
FROM node:22.23.3-alpine AS build

WORKDIR /app

ENV ASTRO_TELEMETRY_DISABLED=1

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.28-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
