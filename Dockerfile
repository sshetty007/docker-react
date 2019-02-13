# Use an existing docker image as a base
FROM node:alpine as builder

# Download and install a dependency
WORKDIR /app
COPY package.json .
RUN npm install 
COPY . .

# Tell the image what to do when it starts as a container
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


