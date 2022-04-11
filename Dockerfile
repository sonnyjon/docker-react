#
# Build Phase
#
FROM node:16-alpine AS builder

WORKDIR '/app'

COPY ./package.json ./
RUN npm install

COPY ./ ./

RUN npm run build
#
# Run Phase
#
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
