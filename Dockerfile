FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache tar
COPY ds-bakery-v13.2.tgz.b64 /tmp/ds-bakery.tgz.b64
RUN base64 -d /tmp/ds-bakery.tgz.b64 > /tmp/ds-bakery.tgz \
 && tar -xzf /tmp/ds-bakery.tgz -C /app \
 && rm /tmp/ds-bakery.tgz /tmp/ds-bakery.tgz.b64 \
 && cd /app/backend \
 && npm install --omit=dev
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node","backend/src/server.js"]
