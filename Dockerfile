#  Build phase
FROM node:16-alpine as builder

WORKDIR /app

COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build


# app/build will have all the important files
FROM nginx as runingstage
COPY --from=builder /app/build /usr/share/nginx/html

# startup command of nginx will take care of running the server

