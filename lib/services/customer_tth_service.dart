import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter_tirtakencana/models/customer_tth.dart';

class CustomerTTHService {
  Future<List<CustomerTTH>> getCustomerTTHs() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/customer-tth'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((data) => CustomerTTH.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }
}
