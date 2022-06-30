# Конференции Boomstream

## Запуск/Остановка

Для запуска сервера без поддержки записи:

```
docker-compose up -d
```


Если нужна запись:

```
docker-compose -f ./docker-compose.yml -f ./jibri_multi.yml up -d
```


Остановить:

```
docker-compose down -v
```

или

```
docker-compose -f ./docker-compose.yml -f ./jibri_multi.yml down -v
```


## Добавление jibri

Необходимо создать достаточное количество audio устройств:

(https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker#recording--live-streaming-configuration)
(https://community.jitsi.org/t/setup-guide-jitsi-meet-native-multiple-6-jibri-docker-instances-working-on-the-same-aws-server/94181)

Затем, зарегистрировать для них конфигурации в (jibri_multi).

Дополнительные контейнеры должны быть добавлены в (jibri_multi.yml)

## Makefile

Для удобства запуска конфигурации с контейнерами записи добавлен (Makefile). Использйте следующие команды для 
запуска/остановки контейнеров:

```
make start

make stop
```
