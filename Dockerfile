FROM node:lts-alpine as build
WORKDIR /app
COPY . .
RUN npm install

FROM node:lts-alpine
COPY --from=build /app /app
WORKDIR /app
RUN adduser -s /bin/sh -D node_user && chown -R node_user:node_user /app
USER node_user
EXPOSE 4000
CMD ["npm", "start"]