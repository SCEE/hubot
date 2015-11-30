FROM node:4.2.2

CMD ./bin/hubot -a $HUBOT_ADAPTER -n $HUBOT_USER

ENV HUBOT_USER Jay
ENV HUBOT_ADAPTER flowdock

RUN groupadd -g 500 hubot \
 && useradd -m -g 500 -u 500 hubot

WORKDIR /home/hubot
ADD . .

RUN chown -R hubot:hubot /home/hubot/

USER hubot 
RUN npm i
RUN rm -rf /home/hubot/node_modules/hubot-yardmaster/ && git clone https://github.com/SCEE/hubot-yardmaster /home/hubot/node_modules/hubot-yardmaster

