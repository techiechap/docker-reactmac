# Specify base image
FROM node:alpine as builder

#Specify Working dir
WORKDIR /app

# Copy files
COPY package.json  .

#commands to run
RUN npm install
COPY . .
RUN npm build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html