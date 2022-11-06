import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class InitState extends BaseState {
  const InitState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class LoadedState<T> extends BaseState {
  final T data;

  const LoadedState({required this.data}) : assert(data != null);

  @override
  List<Object?> get props => [data];
}

class ErrorState<T> extends BaseState {
  final T data;

  const ErrorState({required this.data}) : assert(data != null);

  @override
  List<Object?> get props => [data];
}

class InputState<T> extends BaseState {
  final T? data;

  const InputState({this.data});

  @override
  List<Object?> get props => [data];
}
