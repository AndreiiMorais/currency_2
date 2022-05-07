import 'package:currency_2/helpers/loading/loading_screen_controller.dart';
import 'package:flutter/material.dart';

class LoadingScreen {
  //singleton
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;
  //
  LoadingScreenController? controller;

  void show({required BuildContext context}) {
    controller = showOverlay(context: context);
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({required BuildContext context}) {
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    //overlay design
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          //darkened background
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );

    //add the overlay to the screen
    state?.insert(overlay);

    return LoadingScreenController(close: () {
      overlay.remove();
      return true;
    });
  }
}

extension Loading on BuildContext {
  void showLoader(BuildContext context) {
    LoadingScreen().show(context: context);
  }

  void hideLoader(BuildContext context) {
    LoadingScreen().hide();
  }
}
