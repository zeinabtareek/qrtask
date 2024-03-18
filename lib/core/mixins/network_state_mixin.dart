// import 'package:flutter/material.dart';
// import '../../networking/network_state.dart';
// abstract class NetworkStateMixin<T> {
//   Widget buildUI(NetworkState<T> networkState);
// }
//
// class NetworkStateWidget<T> extends StatefulWidget {
//   final NetworkStateMixin<T> mixin;
//
//   const NetworkStateWidget({required this.mixin, Key? key}) : super(key: key);
//
//   @override
//   _NetworkStateWidgetState<T> createState() => _NetworkStateWidgetState<T>();
// }
//
// class _NetworkStateWidgetState<T> extends State<NetworkStateWidget<T>> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.mixin.buildUI(NetworkState<T>.initial());
//   }
// }
//
// extension NetworkStateMixinExtension<T> on State<NetworkStateWidget<T>> {
//   Widget handleNetworkState(NetworkState<T> networkState) {
//     return networkState.whenOrNull(
//       initial: () => widget.mixin.buildUI(networkState),
//       // loading: () => widget.mixin.buildUI(networkState),
//       success: (data) => widget.mixin.buildUI(networkState),
//       error: (message, errorList) => widget.mixin.buildUI(networkState),
//     ) ?? widget.mixin.buildUI(networkState);
//   }
// }