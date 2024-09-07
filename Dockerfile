FROM node:20.15.0
WORKDIR C:\dockerized-node-app

COPY package*.jason ./
RUN npm install

COPY . .

EXPOSE 3000
CMD [ "node", "app.js" ]
