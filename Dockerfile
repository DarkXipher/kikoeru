FROM node:lts-hydrogen
RUN mkdir -p /opt/app
RUN touch db.sqlite3

RUN apt-get update && \
    apt-get upgrade -y 
WORKDIR /opt/app
COPY package*.json ./
RUN npm install 
COPY . .
RUN npm run build
EXPOSE 8888
CMD [ "npm", "run", "start"]
