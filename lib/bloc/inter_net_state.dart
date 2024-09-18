part of 'inter_net_bloc.dart';

@immutable
abstract class InterNetState {}

class InterNetInitial extends InterNetState {}

class InterNetInial extends InterNetState {}

class ConnectedInterNet extends InterNetState {
  final String mes;

  ConnectedInterNet({
    required this.mes,
  });
}

class NotConnectedInterNetState extends InterNetState {
  final String mes;

  NotConnectedInterNetState({
    required this.mes,
  });
}
