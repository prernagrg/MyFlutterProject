import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        actions: [Icon(Icons.logout)],
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 80),
            Text(
              'This is an App Bar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          // 👉 Side effects (NO UI here)
          if (state.counter == 5) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Reached 5")));
          }
        },
        builder: (context, state) {
          // 👉 UI rebuild here
          return Center(
            child: Text(
              "Count: ${state.counter}",
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => bloc.add(IncrementEvent()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => bloc.add(DecrementEvent()),
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
