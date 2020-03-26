FROM node:12.16.1-alpine3.10

ENV APP_USER node
ENV APP_HOME /app

RUN mkdir -p $APP_HOME && chown -R $APP_USER:$APP_USER $APP_HOME

USER $APP_USER
WORKDIR $APP_HOME

COPY package*.json .jshintrc $APP_HOME/
RUN npm install

COPY src $APP_HOME/src/

EXPOSE 3000
CMD ["node", "src/app.js"]
