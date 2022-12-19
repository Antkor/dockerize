# Build phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Run phase (ngnix default command is to start ngnix)
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html