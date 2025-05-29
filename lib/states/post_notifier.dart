// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:sweep/classes/post.dart';

import 'package:flutter/foundation.dart'; // debugPrintを使用するためにインポート
import 'package:path/path.dart' as p; // pathパッケージをインポート

class PostNotifier extends AutoDisposeNotifier<Post?> {
  @override
  Post? build() => null;

  void set(Post post) {
    state = post;
  }

  Future<void> submit() async {
    final storageRef = FirebaseStorage.instance.ref();
    final List<String> imageStorageURLs = [];
    final List<String> imageStoragePaths = [];
    final uuid = Uuid(); // Uuidインスタンスを作成

    for (final path in state!.imagePaths) {
      final img.Image? originalImage =
          img.decodeImage(File(path).readAsBytesSync());
      if (originalImage == null) {
        debugPrint('画像のデコードに失敗しました: $path');
        continue; // 次の画像へスキップ
      }
      final img.Image resizedImage = img.copyResize(
        originalImage,
        width: 300,
      );
      final List<int> resizedBytes = img.encodePng(resizedImage);
      final Uint8List resizedUnit8List = Uint8List.fromList(resizedBytes);

      final String fileExtension = p.extension(path);
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${uuid.v4()}$fileExtension';

      final imageRef = storageRef.child("post_img/$fileName");
      final uploadTask = imageRef.putData(
        resizedUnit8List,
        SettableMetadata(
          contentType: "image/${fileExtension.replaceAll('.', '')}",
        ),
      );

      final TaskSnapshot snapshot = await uploadTask; // awaitを追加
      imageStorageURLs.add(await snapshot.ref.getDownloadURL());
      imageStoragePaths.add("post_img/$fileName"); // 生成したファイル名を使用
    }

    final data = state!.toJson();
    data["imageURLs"] = imageStorageURLs;
    data["imagePaths"] = imageStoragePaths;

    final postDocs = FirebaseFirestore.instance.collection("post").doc();
    postDocs.set(data);
  }
}

final postProvider =
    AutoDisposeNotifierProvider<PostNotifier, Post?>(PostNotifier.new);
