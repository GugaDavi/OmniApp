import 'dart:typed_data';

import 'package:omni_app/models/dev_model.dart';
import 'package:http/http.dart' as http;

class DevImageToBytes {
  DevImageToBytes._();

  static Future<Uint8List> getBytes(DevModel dev) async {
    // Image img = await Image.network(dev.avatarUrl, width: 50, height: 50);
    // img.
    final http.Response response = await http.get(dev.avatarUrl);

    return response.bodyBytes;
  }
}
