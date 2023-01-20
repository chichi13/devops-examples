# Prometheus : Introduction

Lancement de la stack depuis ce dossier.

## Prometheus

Création du network global :

```bash
docker network create monitoring
```

Lancement du container prometheus :

```bash
docker run -d --name prometheus \
--network monitoring \
-v $PWD/etc/:/prometheus/ \
-p 9090:9090 prom/prometheus --web.enable-lifecycle
```

## Grafana

```bash
mkdir grafana-data

docker run -d --name grafana \
--network monitoring \
-v $PWD/grafana-data/:/var/lib/grafana \
-p 3000:3000 grafana/grafana
```

## Node Exporter

```bash
docker run -d \
--name node-exporter \
--network monitoring \
-p 9100:9100 \
quay.io/prometheus/node-exporter:latest \
--path.rootfs=/host
```

## Alert Manager

```bash
docker run -d \
  --name alertmanager \
  --network monitoring \
  -p 9093:9093 \
  quay.io/prometheus/alertmanager
```