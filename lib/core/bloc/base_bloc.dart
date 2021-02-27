import 'package:fancy_stream/fancy_stream.dart';
import 'package:flutter/cupertino.dart';

/// BaseBloc<Event, Action>
/// If wants to use default Event and Action functions
/// You need to call super in constructor of your class
abstract class BaseBloc<E, A, S> extends FancyDelegate {
  @mustCallSuper
  BaseBloc() {
    listenOn<E>(onState);
    listenOn<A>(onAction);
  }

  void dispatchState(E state) => dispatchOn<E>(state);
  void dispatchAction(A action) => dispatchOn<A>(action);
  void dispatchAnswer(S answer) => dispatchOn<S>(answer);

  void onState(E event);
  void onAction(A action);
}
