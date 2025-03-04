import 'package:flutter/material.dart';
import 'package:facebook_replication/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CustomDialog {
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error', style: TextStyle(color: Colors.red)),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: FB_DARK_PRIMARY,
                  foregroundColor: Colors.white),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  static void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success', style: TextStyle(color: Colors.green)),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: FB_DARK_PRIMARY,
                  foregroundColor: Colors.white),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}

customShowImageDialog (BuildContext context, {required imageUrl}) {
  AlertDialog alertDialog = AlertDialog(
    content: Container(
      height: 300,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                   icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                      color: FB_DARK_PRIMARY, value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 100.0,
                  ),
              ),
            ],
          ),
        ),
      ),
    )
  );
  showDialog(context: context, builder: (BuildContext context) {
    return alertDialog;
  });
  
}