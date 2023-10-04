#build phase

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .                 
RUN npm install
COPY . . 
RUN npm run build


#run phase

FROM nginx

# EXPOSE 80   / use this if you are connecting to AWS /
COPY --from=builder /app/build /usr/share/nginx/html
