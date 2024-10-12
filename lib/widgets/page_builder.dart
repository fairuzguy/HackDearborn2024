import 'package:flutter/material.dart';

enum PageRouteTransition {
  none,
  slide,
  fade,
}

class PageBuilder {
  final Key? key;
  final void Function() onNavigatePushStart;
  final void Function() onNavigatePopComplete;
  final bool opaque;
  final PageRouteTransition transition; // can be null
  final Widget newPageWidget;
  static void _defaultCallback() {}
  const PageBuilder({
    this.key,
    this.onNavigatePushStart = _defaultCallback,
    this.onNavigatePopComplete = _defaultCallback,
    this.opaque = true,
    this.transition = PageRouteTransition.none,
    required this.newPageWidget,
  });

  PageRouteBuilder<dynamic> createPageRouteBuilder(BuildContext context) {
    late PageRouteBuilder newPage; // for self-referencing purposes
    newPage = transition == PageRouteTransition.none? PageRouteBuilder( // main push
      opaque: opaque,
      pageBuilder: (BuildContext context, _, __) {
        if (onNavigatePushStart != PageBuilder._defaultCallback) {
          Future.microtask(onNavigatePushStart); // !! what a find, this would get called in a build cycle where setState can't be called
        }
        if (onNavigatePopComplete != PageBuilder._defaultCallback) {
          late void Function() listener;
          listener = () {
            if (newPage.animation!.isDismissed) {
              onNavigatePopComplete();
              newPage.animation!.removeListener(listener);
            }
          };
          newPage.animation!.addListener(listener);
        }
        return newPageWidget;
      },
    ) : PageRouteBuilder( // main push
      opaque: opaque,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (transition == PageRouteTransition.fade) {
          return FadeTransition(opacity: animation, child: child);
        }
        if (transition == PageRouteTransition.slide) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        }
        return Container(); // nothing reaches here
      },
      pageBuilder: (BuildContext context, _, __) {
        if (onNavigatePushStart != PageBuilder._defaultCallback) {
          Future.microtask(onNavigatePushStart); // !! what a find, this would get called in a build cycle where setState can't be called
        }
        if (onNavigatePopComplete != PageBuilder._defaultCallback) {
          late void Function() listener;
          listener = () {
            if (newPage.animation!.isDismissed) {
              onNavigatePopComplete();
              newPage.animation!.removeListener(listener);
            }
          };
          newPage.animation!.addListener(listener);
        }
        return newPageWidget;
      },
    );
    return newPage;
  }
}