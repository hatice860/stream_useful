import 'package:flutter/material.dart';
import 'package:stream_useful/sayac_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final SayacViewModel sayacViewModel = SayacViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: StreamBuilder(
              initialData:sayacViewModel.init (),

          stream: sayacViewModel.sayacStream,
          builder: (context, snapshot) => Text(title +"${snapshot.data}")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: sayacViewModel.sayacStream,
              builder: (context, snapshot) => Text(
                snapshot.hasData
                    ? snapshot.data.toString()
                    : "Değer yok"
                        '1',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.arttir();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.azalt();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
