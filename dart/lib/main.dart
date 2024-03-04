import 'package:flutter/material.dart';
import 'package:opentelemetry/sdk.dart' as otel_sdk;

// Optionally, multiple processors can be registered
final provider = otel_sdk.TracerProviderBase(processors: [
  otel_sdk.BatchSpanProcessor(
    otel_sdk.CollectorExporter(
      Uri.parse('http://localhost:4318/v1/traces'),
    ),
    scheduledDelayMillis: 500,
    maxExportBatchSize: 512,
  ),
  otel_sdk.SimpleSpanProcessor(otel_sdk.ConsoleExporter())
]);

final tracer = provider.getTracer('instrumentation-name');
registerGlobalTracerProvider(provider) {}
// final tracer = globalTracerProvider.getTracer('instrumentation-name');

void main() {
  final span = tracer.startSpan('doingWork');
  runApp(const MyApp());
  span.end();
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
    final spanClick = tracer.startSpan('click');
    setState(() {
      _counter++;
    });
    spanClick.end();
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
