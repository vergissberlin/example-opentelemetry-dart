# Example - Dart with Flutter an OpenTelemetry

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

This example shows how to use the OptenTelemetry with Dart and Flutter.

## Components

- [OpenTelemetry Collector](https://opentelemetry.io/docs/collector/)
- [Jaeger](https://www.jaegertracing.io/)
- [Flutter Exampe App](https://flutter.dev/)
- [Dart OpenTelemetry](https://pub.dev/packages/opentelemetry)

It starts a simple Flutter app that sends traces to the OpenTelemetry 
Collector, which then sends the traces to Jaeger. As a storage backend,
Jaeger uses Elasticsearch.

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## Features

- [x] Collect metrics from the Flutter app
- [x] Collect logs from the Flutter app
- [ ] Collect traces from the Flutter app
- [ ] Collect metrics with custom attributes from the Flutter app
- [ ] Offline capabilities to send traces to the OpenTelemetry Collector

![OTel Edge Cloud Flow](docs/OTel-Edge-and-Cloud.excalidraw.dark.png)

```mermaid
flowchart TD
    A[Application] --> B[OpenTelemetry SDK]
    B --> C[OTel Collector Edge]
    C --> D[File Exporter]
    D --> C
    C --> E[OTel Collector Cloud]
    E --> F[Backend]
```
