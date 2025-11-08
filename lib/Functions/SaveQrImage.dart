import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';


class ShareQRCode
{
  final GlobalKey qrkey;

  ShareQRCode(this.qrkey);

  Future<void> shareQrImage(BuildContext context) async {
    try {
      // Capture the widget as image
      RenderRepaintBoundary boundary =
      qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save and share
      final tempDir = Directory.systemTemp;
      final file = await File(
        '${tempDir.path}/qr_code.png',
      ).writeAsBytes(pngBytes);
      await Share.shareXFiles([XFile(file.path)], text: 'Here’s my QR Code!');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error sharing image: $e")));
    }
  }
}

