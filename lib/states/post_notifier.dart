import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:sweep/classes/post.dart';

class PostNotifier extends StateNotifier<Post?> {
  PostNotifier() : super(null);

  void clear() {
    state = null;
  }

  void set(Post post) {
    state = post;
    print(state);
  }

  Future<void> submit() async {
    final storageRef = FirebaseStorage.instance.ref();
    final List<String> imageStorageURLs = [];
    final List<String> imageStoragePaths = [];

    state!.imagePaths.forEach((path) async {
      final img.Image? originalImage =
          img.decodeImage(File(path).readAsBytesSync());
      final img.Image resizedImage = img.copyResize(
        originalImage!,
        width: 300,
      );
      final List<int> resizedBytes = img.encodeBmp(resizedImage);
      final Uint8List resizedUnit8List = Uint8List.fromList(resizedBytes);

      final imageRef = storageRef.child("post_img/${path}");
      final uploadTask = imageRef.putData(
        resizedUnit8List,
        SettableMetadata(
          contentType: "aplication/octet-stream",
        ),
      );

      imageStorageURLs.add(await (await uploadTask).ref.getDownloadURL());
      imageStoragePaths.add("post_img/${path}");
    });

    final data = {
      "imageURLs": imageStorageURLs,
      "imagePaths": imageStoragePaths,
      "location": GeoPoint(state!.location.latitude, state!.location.longitude),
      "comment": state!.comment,
      "time": Timestamp.fromDate(state!.time),
      "point": 1,
      "nice": 0,
      "type": "trash",
    };

    final postDocs = FirebaseFirestore.instance.collection("post").doc();
    postDocs.set(data);
  }
}

final postProvider = StateNotifierProvider<PostNotifier, Post?>((ref) {
  return PostNotifier();
});
