import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Observable<T> {
  final StreamTransformer<T, T>? validator;
  //
  Observable({this.validator}) {
    _controller = BehaviorSubject();
  }

  Observable.seeded(T seed, {this.validator}) {
    _controller = BehaviorSubject.seeded(seed);
  }

// BehaviorSubject its depend on rxdart dependancy

  late final BehaviorSubject<T> _controller;

  Stream<T> get obs$ {
    final stream = _controller.stream;
    if (validator != null) {
      return stream
          .debounceTime(const Duration(milliseconds: 200))
          .transform(validator!);
    }
    return stream;
  }

  T? get value =>
      _controller.valueOrNull; // synchronous access to last emitted value

  void addValue(T value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }
}
