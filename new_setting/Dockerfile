FROM ubuntu:18.04

MAINTAINER cyan_nyan
LABEL version="0.1.0"

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
RUN curl -sSL https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar > server.jar
RUN java -jar server.jar
CMD echo 'eula=true' > eula.txt && sed -i -e "s/level-seed=/level-seed=1167325225671706871/g" server.properties && java -Xms4096M -Xmx4096M -jar server.jar

