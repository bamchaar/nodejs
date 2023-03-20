FROM node:10 AS ui-build  
WORKDIR /usr/src/NODEJS
COPY . /usr/src/NODEJS
RUN cd /usr/src/NODEJS
RUN npm install
RUN npm run build

FROM node:10 AS server-build  
WORKDIR /root/
COPY --from=ui-build /usr/src/NODEJS/build /NODEJS/build
RUN npm install -g serve
EXPOSE 3080
CMD ["serve -s build"]
