import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter_tirtakencana/models/customer_tth_detail.dart';

class CustomerTTHDetailService {
  Future<List<CustomerTTHDetail>> getCustomerTTHDetails() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/customer-tth-detail'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse
          .map((data) => CustomerTTHDetail.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }
}
