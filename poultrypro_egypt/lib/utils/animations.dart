import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Advanced Animation Effects
class AdvancedAnimations {
  // Pulse Effect
  static Widget pulse({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
    double minScale = 0.95,
    double maxScale = 1.05,
  }) {
    return child.animate(onInit: (controller) => controller.repeat(reverse: true)).scale(
      begin: minScale,
      end: maxScale,
      duration: duration,
    );
  }

  // Shimmer Effect
  static Widget shimmer({
    required Widget child,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    return child
        .animate(onInit: (controller) => controller.repeat())
        .shimmer(
          duration: duration,
          color: Colors.white24,
        );
  }

  // Glow Effect
  static Widget glow({
    required Widget child,
    required Color glowColor,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return child
        .animate(onInit: (controller) => controller.repeat(reverse: true))
        .custom(
          duration: duration,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: glowColor.withOpacity(value),
                    blurRadius: 20 * value,
                    spreadRadius: 2 * value,
                  ),
                ],
              ),
              child: child,
            );
          },
          child: child,
        );
  }

  // Bounce Effect
  static Widget bounce({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return child
        .animate(onInit: (controller) => controller.repeat())
        .moveY(
          begin: 0,
          end: -10,
          duration: duration,
          curve: Curves.easeInOutQuad,
        );
  }

  // Rotate Effect
  static Widget rotate({
    required Widget child,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    return child
        .animate(onInit: (controller) => controller.repeat())
        .rotate(duration: duration);
  }

  // Float Effect
  static Widget float({
    required Widget child,
    Duration duration = const Duration(milliseconds: 3000),
  }) {
    return child
        .animate(onInit: (controller) => controller.repeat(reverse: true))
        .moveY(
          begin: 0,
          end: -8,
          duration: duration,
          curve: Curves.easeInOutSine,
        );
  }

  // Flip Effect
  static Widget flip({
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return child.animate().custom(
      duration: duration,
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..setEntry(3, 2, 0.001)
            ..rotateY(value * 3.14159 * 2),
          child: child,
        );
      },
    );
  }

  // Fade In Up
  static Widget fadeInUp({
    required Widget child,
    Duration duration = const Duration(milliseconds: 600),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .slideY(begin: 0.3, end: 0, duration: duration);
  }

  // Fade In Down
  static Widget fadeInDown({
    required Widget child,
    Duration duration = const Duration(milliseconds: 600),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .slideY(begin: -0.3, end: 0, duration: duration);
  }

  // Fade In Left
  static Widget fadeInLeft({
    required Widget child,
    Duration duration = const Duration(milliseconds: 600),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .slideX(begin: -0.3, end: 0, duration: duration);
  }

  // Fade In Right
  static Widget fadeInRight({
    required Widget child,
    Duration duration = const Duration(milliseconds: 600),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .slideX(begin: 0.3, end: 0, duration: duration);
  }

  // Scale In
  static Widget scaleIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .scale(begin: 0.8, end: 1, duration: duration);
  }

  // Zoom In
  static Widget zoomIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    int delayMs = 0,
  }) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(duration: duration)
        .scale(begin: 0, end: 1, duration: duration, curve: Curves.easeOutBack);
  }
}

// Custom Page Transition
class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  final WidgetBuilder builder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}

// Custom Scale Page Transition
class ScalePageRoute<T> extends PageRoute<T> {
  ScalePageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  final WidgetBuilder builder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
      ),
      child: FadeTransition(
        opacity: animation,
        child: builder(context),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}

// Custom Slide Page Transition
class SlidePageRoute<T> extends PageRoute<T> {
  SlidePageRoute({
    required this.builder,
    this.slideDirection = SlideDirection.leftToRight,
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  final WidgetBuilder builder;
  final SlideDirection slideDirection;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Offset begin;
    switch (slideDirection) {
      case SlideDirection.leftToRight:
        begin = const Offset(-1, 0);
        break;
      case SlideDirection.rightToLeft:
        begin = const Offset(1, 0);
        break;
      case SlideDirection.topToBottom:
        begin = const Offset(0, -1);
        break;
      case SlideDirection.bottomToTop:
        begin = const Offset(0, 1);
        break;
    }

    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: Offset.zero).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
      ),
      child: builder(context),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

// Custom Rotation Page Transition
class RotationPageRoute<T> extends PageRoute<T> {
  RotationPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  final WidgetBuilder builder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        ),
        child: FadeTransition(
          opacity: animation,
          child: builder(context),
        ),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 700);
}
