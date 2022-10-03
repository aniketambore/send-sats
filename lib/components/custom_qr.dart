import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQR extends StatelessWidget {
  const CustomQR({Key? key, required this.qrData}) : super(key: key);
  final String qrData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: QrImage(
        data: qrData,
        version: QrVersions.auto,
        size: 180,
        embeddedImage:
            const NetworkImage('https://i.ibb.co/P48kPGy/lightning.png'),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: const Size(80, 80),
        ),
        backgroundColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
        errorStateBuilder: ((context, error) {
          return const Icon(Icons.error_outline);
        }),
      ),
    );
  }
}
