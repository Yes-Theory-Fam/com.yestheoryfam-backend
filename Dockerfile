FROM node:12.19.0-alpine3.12 AS node-build

RUN mkdir /backend
WORKDIR /backend

COPY . .

RUN npm install

RUN npm run-script build

RUN cp .env build/.env
RUN cp package.json build/package.json
RUN cp package-lock.json build/package-lock.json
RUN cp ormconfig.json build/ormconfig.json
WORKDIR /backend/build
RUN npm install --only=production

FROM node:14.14.0-alpine3.12 AS node-backend
EXPOSE 3000
WORKDIR /backend
COPY --from=node-build /backend/build /backend
CMD [ "node", "/backend/src/index.js" ]
