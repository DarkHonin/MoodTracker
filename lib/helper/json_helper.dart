import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonHelper {
  Future<Map<String, dynamic>> readJson(String path) async {
    final root_path = await '';

    final file = File('$root_path/$path');
    final content = await file.readAsString();
    return jsonDecode(content);
  }

  Future<bool> saveJson(String path, Map<String, dynamic> data) async {
    final root_path = await '';
    try {
      final file = File('$root_path/$path');
      file.writeAsString(jsonEncode(data));
      return true;
    } catch (e) {
      print(e);
      print('Failed to write file: $root_path : $path');
      return false;
    }
  }
}
