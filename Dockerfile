FROM openjdk:18-slim

EXPOSE 4000
EXPOSE 8080
EXPOSE 9000
EXPOSE 9099

ENV FIREBASE_USERNAME=test@example.com
ENV FIREBASE_PASSWORD=server-admin

RUN apt update && apt install -y wget

WORKDIR /usr/local/bin
RUN wget https://firebase.tools/bin/linux/latest -O firebase && \
  chmod +x ./firebase
RUN firebase setup:emulators:database && \
  firebase setup:emulators:firestore && \
  firebase setup:emulators:storage && \
  firebase setup:emulators:ui

WORKDIR /home/firebase
COPY ./ ./

ENTRYPOINT firebase emulators:start --import ./data/