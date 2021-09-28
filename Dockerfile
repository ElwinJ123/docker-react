#Docker multi-step build process 
#Step 1, set up all the configuration 
#NOTE : make sure you tag the step/stage of the build process
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build


#Second page - run phase , just putting in the second from kills/terminates the previos one
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html