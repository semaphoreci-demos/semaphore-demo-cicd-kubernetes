FROM node:10.16.0-alpine
COPY package*.json ./
RUN npm install
COPY src/*.js ./
EXPOSE 3000
CMD [ "npm", "run", "start" ]
