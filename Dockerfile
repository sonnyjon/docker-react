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
# Use EXPOSE for Elasticbeanstalk
# EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
