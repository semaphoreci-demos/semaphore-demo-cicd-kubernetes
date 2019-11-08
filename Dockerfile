FROM node:10.16.0-alpine


ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY package*.json $APP_HOME/
RUN npm install

RUN mkdir ./src
COPY src $APP_HOME/src/
RUN ls -la 
RUN ls -la src

EXPOSE 3000
CMD [ "npm", "run", "start" ]
