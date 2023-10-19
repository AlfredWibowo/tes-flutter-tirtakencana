import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter_tirtakencana/models/mobile_config.dart';

class MobileConfigService {
  Future<List<MobileConfig>> getMobileConfigs() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/mobile-config'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((data) => MobileConfig.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }
}
