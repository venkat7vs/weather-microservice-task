#FROM node:9
FROM node:10.16.2
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# To handle 'not get uid/gid'
#RUN apk --no-cache add --virtual builds-deps build-base python
RUN npm config set unsafe-perm true
#RUN apt-get update && apt-get install -y vim 
#RUN npm install pm2 -g
# Install app dependencies
COPY . /usr/src/app/
RUN npm install node-gyp
RUN npm install ejs
RUN npm install 
RUN npm audit fix
EXPOSE 3000 

#RUN npm install

CMD [ "npm", "start" ]
