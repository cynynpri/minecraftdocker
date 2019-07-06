FROM ubuntu:18.04

LABEL version="0.1.0" maintainer=cyan_nyan

EXPOSE 25565

RUN apt-get update -q && apt-get install -qy apt-utils vim sed default-jre curl && apt-get clean -q && rm -rf /var/lib/apt/lists/*

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update -q && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | \
        xargs apt-get install -qy --reinstall && \
apt-get clean -q && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/minecraft
# create User
RUN useradd -d /home/minecraft minecraft
WORKDIR /home/minecraft
ENV HOME /home/minecraft
RUN chown minecraft:minecraft -R /home/minecraft
USER minecraft

RUN mkdir /home/minecraft/servers
WORKDIR /home/minecraft/servers
# RUN curl -sSL https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar > server.jar
# server.jarの実体は各自で取得.
USER root
RUN apt-get purge -qy --auto-remove curl && apt-get autoremove -qy && \
    apt-get clean -q && rm -rf /var/lib/apt/lists/*
USER minecraft
RUN java -jar server.jar
# seed setting.
RUN sed -i -e "s/level-seed=/level-seed=1167325225671706871/g" server.properties
# spawn-protection setting.
RUN sed -i -e "s/spawn-protection=16/spawn-protection=0/g" server.properties
# eula setting
RUN echo 'eula=true' > eula.txt

CMD java -jar server.jar
