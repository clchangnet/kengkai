FROM node:latest

RUN useradd --user-group --create-home --shell /bin/false nodejs &&\
  npm install --global npm@4.0.0

ENV HOME=/home/nodejs

ADD . $HOME/kengkai
RUN chown -R nodejs:nodejs $HOME/*

USER nodejs
WORKDIR $HOME/kengkai
RUN npm install

# expose port 3000
EXPOSE 3000

CMD ["node", "./bin/www"]
