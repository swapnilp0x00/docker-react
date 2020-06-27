FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html