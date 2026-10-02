FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache unzip
COPY ["dsb_v132_slim (1).zip", "/tmp/ds-bakery.zip"]
RUN unzip -q /tmp/ds-bakery.zip -d /app \
 && rm /tmp/ds-bakery.zip \
 && cd /app/backend \
 && npm install --omit=dev
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node","backend/src/server.js"]
