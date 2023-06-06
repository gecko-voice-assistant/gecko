# build stage
FROM node:lts-alpine as build-stage
WORKDIR /frontend
COPY frontend/src/package*.json ./
RUN npm install
COPY frontend/src/ .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /frontend/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]