import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Base state emitter class.
abstract class BaseStateEmitter<L extends BaseStateListener,
    B extends GenericBloc> {
  /// Initializes base state emitter.
  BaseStateEmitter(this.blocManager) {
    blocManager.registerStateEmitter(this);
  }

  /// Bloc manager instance.
  final BaseBlocManager blocManager;

  /// Handles states for state listener [L].
  void handleStates({required L stateListener, required Object state});

  /// Emits state to corresponding listener.
  void call({required BaseStateListener stateListener, Object? state}) {
    // ignore: avoid_print
    print(
      'BaseStateEmitter: $stateListener, $state, ${blocManager.fetch<B>().state}',
    );

    if (stateListener is L) {
      handleStates(
        stateListener: stateListener,
        state: state ?? blocManager.fetch<B>().state,
      );
    }
  }
}
