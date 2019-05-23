FROM centos:centos7
LABEL version="0.1.0"
# version 0.1.0
# テストしてないのでversion 0.1.0

EXPOSE 25565
# minecraft often use port settings
# plz edit minecraft port. 25565 -> hoge

# マインクラフトでは25565ポートがよく使われます
# もし、個人で利用しているポートが25565でなければ、
# `EXPOSE 25565`の部分の数値を編集してください
# ポートフォワーディングしてコンテナ内部では25565のまま外部とやりとりするポートを変更できます。
# 詳しくは`Docker ポートフォワーディング`で検索してください。

RUN yum update -y && yum install -y vim java-1.8.0-openjdk unzip

RUN mkdir /minecraft

COPY minecraft_server.zip /minecraft/
# need minecraft_server.zip
# minecraft_server.zip が必要になります。
# minecraft_serverディレクトリツリーは以下のように構成してください。

# minecraft_server  <- ここをzip化する.
# |
# ├logs
# ├world
# ├banned-ips.json
# ├banned-players.json
# ├eula.txt
# ├ops.json
# ├server.jar
# ├server.properties
# ├usercache.json
# └whitelist.json

RUN ./usr/bin/unzip /minecraft/minecraft_server.zip
# minecraft_server.zip -> /minecraft_server
# 上記のコマンドでminecraft_server.zipは/minecraft_serverというディレクトリに変換されます。

WORKDIR /minecraft_server
CMD echo "eula=true" > eula.txt && java -jar server.jar
## end dockerfile.
