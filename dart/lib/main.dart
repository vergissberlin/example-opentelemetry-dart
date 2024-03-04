import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opentelemetry/sdk.dart' as otel_sdk;

// Optionally, multiple processors can be registered
final provider = otel_sdk.TracerProviderBase(processors: [
  otel_sdk.BatchSpanProcessor(
    otel_sdk.CollectorExporter(
      Uri.parse('http://localhost:4318/v1/traces'),
    ),
  ),
  otel_sdk.SimpleSpanProcessor(otel_sdk.ConsoleExporter())
]);

final tracer = provider.getTracer('instrumentation-name');
// final tracer = globalTracerProvider.getTracer('instrumentation-name');

registerGlobalTracerProvider(provider) {}

void main() {
  final span = tracer.startSpan('doingWork');
  runApp(const MyApp());
  // _manuelRequest();
  span.end();
}

void _manuelRequest() async {
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.https('https://requestbin.myworkato.com/1ea29g51', 'post'),
        body: {'name': 'doodle', 'color': 'blue'});
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var uri = Uri.parse(decodedResponse['uri'] as String);
    print(await client.get(uri));
  } finally {
    client.close();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
