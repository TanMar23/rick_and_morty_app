import 'dart:async';

import '../../presentation/mixins/disposable_cubit.dart';

String? streamExtension;

extension StreamExtension on StreamSubscription<dynamic> {
  void dispose(DisposableCubit cubit) {
    cubit.addSubscription(this);
  }
}
