#Base
FROM node:alpine AS base
WORKDIR /app
COPY package*.json ./
#Dependencies
FROM base AS dependencies
RUN npm install
COPY . .
#Test
FROM dependencies AS test
RUN npm run test
#Release
FROM node:alpine AS release
WORKDIR /app
COPY --from=dependencies /app /app
CMD ["node", "appointment-service.js"]