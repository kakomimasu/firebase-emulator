# Firebase emulator for kakomimasu/server

## 機能

()内はポート番号です。

- Authentication (9099)
- Cloud Firestore (8080)
- Realtime Database (9000)
- Emulator Suite UI (4000)

## Build

```console
$ docker build -t firebase-emu:latest .    
```

## Run

下記コマンドを実行するとデタッチドモードでFirebase エミュレータが起動します。

```console
$ docker pull ghcr.io/kakomimasu/firebase-emulator:latest
$ docker run -p 4000:4000 -p 8080:8080 -p 9000:9000 -p 9099:9099 -d --name firebase-emu firebase-emu:latest
```