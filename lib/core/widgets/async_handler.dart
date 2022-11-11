import 'package:tiutiu/Widgets/loading_page.dart';
import 'package:tiutiu/Widgets/error_page.dart';
import 'package:tiutiu/Widgets/empty_list.dart';
import 'package:flutter/material.dart';

class AsyncHandler<T> extends StatelessWidget {
  const AsyncHandler({
    this.forceReturnBuildWidget = false,
    this.showLoadingScreen = true,
    required this.buildWidget,
    this.forcedDataReturned,
    required this.snapshot,
    this.onErrorCallback,
    this.loadingMessage,
    this.noResultScreen,
    this.errorMessage,
    this.errorWidget,
    super.key,
  }) : assert(forceReturnBuildWidget ? forcedDataReturned != null : forcedDataReturned == null);

  final Widget Function(T data) buildWidget;
  final void Function()? onErrorCallback;
  final bool forceReturnBuildWidget;
  final AsyncSnapshot<T> snapshot;
  final Widget? noResultScreen;
  final String? loadingMessage;
  final bool showLoadingScreen;
  final T? forcedDataReturned;
  final String? errorMessage;
  final Widget? errorWidget;

  Widget _handleSnapshotState() {
    final ConnectionState connectionState = snapshot.connectionState;

    if (snapshot.hasError) {
      return errorWidget ??
          ErrorPage(
            onErrorCallback: onErrorCallback,
            errorMessage: errorMessage,
            error: snapshot.error,
          );
    }

    if (connectionState == ConnectionState.waiting && showLoadingScreen) return LoadingPage();

    if ((!snapshot.hasData || snapshot.data == null) && !forceReturnBuildWidget)
      return noResultScreen ?? EmptyListScreen();

    if (snapshot.data is List && (snapshot.data as List).isEmpty) return noResultScreen ?? EmptyListScreen();

    return forceReturnBuildWidget ? buildWidget(forcedDataReturned!) : buildWidget(snapshot.data!);
  }

  @override
  Widget build(BuildContext context) => _handleSnapshotState();
}
