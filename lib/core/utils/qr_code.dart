import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget buildQrCode(String data, {double size = 200}) {
  return QrImageView(
    data: data,
    version: QrVersions.auto,
    size: size,
    backgroundColor: Colors.white,
  );
}