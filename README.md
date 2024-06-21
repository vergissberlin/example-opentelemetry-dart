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

1. Offline capabilities to send traces to the OpenTelemetry Collector
2. Collect metrics from the Flutter app
3. Collect logs from the Flutter app
4. Collect traces from the Flutter app
5. Collect metrics with custom attributes from the Flutter app
