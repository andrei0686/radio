# Используем базовый образ Ubuntu 20.04FROM ubuntu:20.04
FROM ubuntu:20.04
MAINTAINER andrei

# Устанавливаем пакеты Icecast и Darkice
RUN apt-get update && apt-get install -y icecast2 darkice
# Открываем порты Icecast (8000) и Darkice (8001) для доступа к потокамEXPOSE 8000
EXPOSE 8001
# Копируем конфигурационные файлы Icecast и Darkice в контейнер
COPY icecast.xml /etc/icecast2/icecast.xmlCOPY darkice.cfg /etc/darkice.cfg
# Запускаем Icecast и Darkice при запуске контейнера
CMD service icecast2 start && darkice -c /etc/darkice.cfg
