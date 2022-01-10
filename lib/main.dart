import 'package:flutter/material.dart';
import 'package:flutter_app/state/manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  get err => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue apis = ref.watch(apiStateFuture);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Riverpod Get API"),
        ),
        body: apis.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('${err()}')),
            data: (apis) {
              /* Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Table(
                    border: TableBorder.all(width: 3.0),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 150.0,
                                left: 150.0,
                                top: 20.0,
                                bottom: 20.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1.0),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          )
                        ],
                      )
                    ],
                  ));*/
            }));
  }
}
