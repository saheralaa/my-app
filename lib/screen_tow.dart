import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr/bloc/inter_net_bloc.dart';

class BlocTow extends StatefulWidget {
  @override
  State<BlocTow> createState() => _LocilaizationState();
}

class _LocilaizationState extends State<BlocTow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Conected'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder<InterNetBloc, InterNetState>(
        builder: (context, state) {
          if (state is ConnectedInterNet) {
            return _text(state.mes);
          } else if (state is NotConnectedInterNetState) {
            return _text(state.mes);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

Widget _text(String mes) {
  return Center(
    child: Text(mes),
  );
}
