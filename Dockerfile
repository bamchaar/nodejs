FROM node:10 AS ui-build  
WORKDIR /usr/src/app
COPY NODEJS/ ./NODEJS/
RUN cd NODEJS && npm install && npm run build

FROM node:10 AS server-build  
WORKDIR /root/
COPY --from=ui-build /usr/src/app/NODEJS/build /NODEJS/build
RUN npm install -g serve
EXPOSE 3080
CMD ["serve -s build"]
