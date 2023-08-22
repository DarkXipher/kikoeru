FROM node:lts-hydrogen
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN node src/server/filesystem/scanner.js
EXPOSE 8888
CMD [ "npm", "run", "start"]
