part of 'inter_net_bloc.dart';

@immutable
abstract class InterNetEvent {}

class ConectedInterNet extends InterNetEvent {}

class NotConectedInterNet extends InterNetEvent {}
