## マインクラフト(バニラ鯖) with Docker
### 使い方(初回起動まで)
1. server.jarを起動して生成されるファイルを,  
   下記画像のように配置する。
2. その配置し終えたフォルダを`minecraft_server`にリネームする.  
3. `minecraft_server`をzip化して`minecraft_server.zip`にする.  
4. git cloneして`Dockerfile`と同一のディレクトリにminecraft_server.zipを配置.  
5. 下記コマンドでコンテナイメージをビルド.  
```bash
$ docker build -t minecraft .
```
6. 下記コマンドでコンテナの初回起動.  
```bash
$ docker run --name minecraft -i -p 25565:25565 minecraft
```
  
### 通常起動
通常使用時は以下のコマンドで起動.  
```bash
$ docker start minecraft
```
  
以下のコマンドで停止.  
```bash
$ docker stop minecraft
```
  
中の出力を確認したいときは以下のコマンド  
```bash
$ docker attach minecraft # これで中に入れるのでopコマンドなど好き勝手に。
```
  
バックアップを取りたい場合  
- 正直かなり手間な作業になるのでオススメしない.  
以下のコマンドで中身のコピーは可能.  
コピー先はこのコマンドを打った階層内.  
コピー先を変更したいなどがある場合は各自`docker cp`コマンドについて調べるのが吉.  
```bash
$ docker cp <minecraftコンテナID>:/minecraft_server minecraft_server
```
- minecraftコンテナIDは以下のコマンドをminecraftコンテナ実行中に打つと表示される.  
つまりはサーバー起動中にコマンドを打つ必要がある.  
```bash
$ docker ps
```
  
#### 参考にしたサイト様
[パンくずリスト  - DockerでMinecraftサーバーを建てた](http://pankuzlife.hatenablog.jp/entry/2017/09/20/003617)  
  
正直[Docker Hub](https://hub.docker.com/r/itzg/minecraft-server/)にあるイメージを利用する運用でいいと思います(こなみかん  
  