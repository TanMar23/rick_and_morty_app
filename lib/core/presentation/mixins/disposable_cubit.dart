import 'dart:async';

mixin DisposableCubit {
  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  final List<StreamSubscription<dynamic>> _subscriptions =
      <StreamSubscription<dynamic>>[];

  void disposeAll() {
    for (final StreamSubscription<dynamic> subscription in _subscriptions) {
      subscription.cancel();
    }
    _isDisposed = true;
  }

  void addSubscription(StreamSubscription<dynamic> subscription) {
    _subscriptions.add(subscription);
  }
}
