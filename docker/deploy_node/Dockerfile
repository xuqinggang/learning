FROM hub.byted.org/toutiao.debian:latest

MAINTAINER WebArchTeam "webarch@bytedance.com"

ENV PATH /home/tiger/system_op/bin:$PATH

ARG REGION

ADD . /bd_build/

RUN chmod +x /bd_build/*.sh

RUN /bd_build/deploy.sh && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# USER tiger:tiger

CMD ["/sbin/my_init"]
