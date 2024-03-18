
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_cubit.dart';
import 'base_state/base_cubit_state.dart';

class BaseView<T extends BaseCubit> extends StatelessWidget {
  final T Function(BuildContext)? vmBuilder;
  final Widget Function(BuildContext, BaseState) builder;
  final Function(BuildContext, BaseState) listener;
  final Widget Function(BuildContext, BaseErrorState)? errorBuilder;

  const BaseView({
    Key? key,
    required this.vmBuilder,
    required this.builder,
    required this.listener,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => vmBuilder!(context),
      child: BlocConsumer<T, BaseState>(
        listener: listener,
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context, BaseState state) => Container(
    child: Stack(
      children: [
        if (state is BaseCompletedState) builder(context, state),
        if (state is BaseErrorState)
          errorBuilder != null
              ? errorBuilder!(context, state)
              : Center(child: Text(state.errorMessage ?? "Something wrong.", )),
        if ((state is BaseLoadingSate
            // && state.isLoading
        )
            || state is BaseInitialState)


          // const Center(child: LoadingDialog()),
          const Center(child: CircularProgressIndicator.adaptive()),
      ],
    ),
  );
}