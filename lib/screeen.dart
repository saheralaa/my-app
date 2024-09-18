import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr/bloc/counter_bloc.dart';
import 'package:pr/screen_tow.dart';

class HomeBloc extends StatefulWidget {
  const HomeBloc({super.key});

  @override
  State<HomeBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeBloc> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Bloc'),
      ),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
            child: const Icon(Icons.plus_one),
          ),
          Container(
            height: 30,
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
            child: const Text('-'),
          ),
          Container(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MaterialButton(
              color: Colors.green,
              onPressed: () {
                context.read<CounterBloc>().add(ResetEvent());
              },
              child:const Text('Reset', style: TextStyle(color: Colors.white)),
            ),
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterInitial) {
                return const Text('0', style: TextStyle(color: Colors.red));
              } else if (state is CounterValueChangedState) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                );
              }
              return Container();
            },
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => BlocTow()),
                  (route) => false);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
