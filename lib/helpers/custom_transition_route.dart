import 'package:flutter/widgets.dart';

enum TransitionType { none, size, scale, fade }

class CustomTRansitionRoute<T> extends PageRouteBuilder<T> {
  final TransitionType transitionType;
  final Duration duration;
  final Widget widget;
  final Curve curve;
  final Curve reverseCurve;

  CustomTRansitionRoute(
      {this.transitionType,
      this.duration = const Duration(milliseconds: 500),
      this.widget,
      this.curve = Curves.easeInExpo,
      this.reverseCurve = Curves.easeInBack})
      : super(
          pageBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary) {
            return widget;
          },
          transitionsBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary, Widget child) {
            switch (transitionType) {
              case TransitionType.size:
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: SizeTransition(sizeFactor: animation, child: child),
                );
              case TransitionType.scale:
                return ScaleTransition(scale: animation, child: child);
              case TransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
              default: //TransitionType.none;
                return child;
            }
          },
          transitionDuration: duration,
          reverseTransitionDuration: duration,
        );
}

class CustomSizeTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  CustomSizeTransitionRoute(this.widget, this.duration)
      : super(
          pageBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary) {
            return widget;
          },
          transitionsBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary, Widget child) {
            // efecto  SizeTransition
            return Align(
              alignment: Alignment.bottomLeft,
              child: SizeTransition(sizeFactor: animation, child: child),
            );
          },
          transitionDuration: Duration(milliseconds: duration),
          reverseTransitionDuration: Duration(milliseconds: duration),
        );
}

class CustomFadeTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  CustomFadeTransitionRoute(this.widget, this.duration)
      : super(
          pageBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary) {
            return widget;
          },
          transitionsBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary, Widget child) {
            //efecto FadeTransition
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: duration),
          reverseTransitionDuration: Duration(milliseconds: duration),
        );
}

class CustomScaleTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  CustomScaleTransitionRoute(this.widget, this.duration)
      : super(
          pageBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary) {
            return widget;
          },
          transitionsBuilder: (_, Animation<double> animation,
              Animation<double> animationSecondary, Widget child) {
            //efecto ScaleTransition
            return ScaleTransition(scale: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: duration),
          reverseTransitionDuration: Duration(milliseconds: duration),
        );
}
