part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

 class InternetInitial extends InternetState {}


class Conect extends InternetCubit{
  final String mes;

  Conect({
    required this.mes,
  });
}

class NotConect extends InternetCubit {
  final String mes;

  NotConect({
    required this.mes,
  });
}
