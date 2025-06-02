// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';

// Project imports:
import 'package:sweep/main.dart';
import 'package:sweep/widgets/point_dialog.dart';

class NotificationScript {
  msgListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final title = notification?.title;
      final text = notification?.body;
      final point = (message.data["point"] as String);

      debugPrint("$title, $text, $point");

      final context = navigatorKey.currentContext;
      if (context != null) {
        showDialog(
          context: context,
          builder: (context) {
            return PointDialog(
              title: title ?? "",
              text: text ?? "",
              point: point,
            );
          },
        );
      }
    });
  }
}
