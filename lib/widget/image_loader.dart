import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taskema/data/storage/pref.dart';
import 'dart:developer' as developer;

import 'package:taskema/data/storage/pref_key.dart';

class ImageLoader extends StatefulWidget {
  final String? iconHash;
  /// if iconHash was null then we should show first word of text
  final String? text;
  const ImageLoader({super.key, required this.iconHash, required this.text});
  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {


  final StringBuffer url = StringBuffer();
  Map<String, String> header = {};


  @override
  Widget build(BuildContext context) {
    if (widget.iconHash != null && widget.iconHash!.isNotEmpty) {
      return FutureBuilder(
        future: _generateUrl(widget.iconHash!),
        builder: (context, snapshot) {
          if (url.toString().isNotEmpty) {
            return CachedNetworkImage(
                imageUrl: url.toString(),
                httpHeaders: header,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) {
                  developer.log("ImageLoader error => $error");
                  return const Icon(Icons.error);
                });
          } else {
            return Text("${snapshot.error}");
          }
        },
      );
    } else {
      return Text(
        widget.text?.substring(0,1) ?? "",
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }

  _generateUrl(String iconHash) async {
    // await storage.read(key: PrefKey.ACCESS_TOKEN).then((accessToken) {
    //   header["Authorization"] = "Bearer $accessToken";
    // });
    await Pref.get(key: PrefKey.FILE_URL).then((baseUrl) {
      url.clear();
      url.write("${baseUrl.toString()}/v1/files?mode=view&hash=$iconHash");
    });
  }


}