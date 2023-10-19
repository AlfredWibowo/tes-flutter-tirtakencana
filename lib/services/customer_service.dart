import 'dart:convert';

import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  Future<List<Customer>> getCustomers() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/customer'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((data) => Customer.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }
}
