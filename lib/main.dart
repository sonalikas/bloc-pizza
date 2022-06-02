import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_bloc/pizza_bloc.dart';

import 'models/pizza_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PizzaBloc()..add(LoadPizzaCounter()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The Pizza Bloc',
          home: MyHomePage(
            title: 'The Pizza Bloc',
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
          if (state is PizzaLoaded) {
            return const CircularProgressIndicator(color: Colors.orange);
          }
          if (state is PizzaLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.pizzas.length}',
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200 / 1.5,
                  width: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      for (int index = 0; index < state.pizzas.length; index++)
                        Positioned(
                            left: 250.toDouble(),
                            top: 400.toDouble(),
                            child: const SizedBox(
                              height: 150,
                              width: 150,
                              child: Text("sona"),

                              //state.pizzas[index].image, //7:10
                            )),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong!');
          }
        }),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.pinkAccent[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.yellowAccent,
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.cyanAccent,
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
            })
      ]),
    );
  }
}
