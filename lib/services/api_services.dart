// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:test_flutter_tirtakencana/models/customer.dart';
// import 'package:test_flutter_tirtakencana/models/customer_tth.dart';
// import 'package:test_flutter_tirtakencana/models/customer_tth_detail.dart';
// import 'package:test_flutter_tirtakencana/models/mobile_config.dart';

// class APIServices {
//   //get all APIs data
//   Future<Map<List<dynamic>> getAllData() async {
//     final responseCustomerAPI = await http.get(
//       Uri.parse('http://localhost:8000/api/customer'),
//     );
//     final responseCustomerTTHAPI = await http.get(
//       Uri.parse('http://localhost:8000/api/customer-tth'),
//     );
//     final responseCustomerTTHDetailAPI = await http.get(
//       Uri.parse('http://localhost:8000/api/customer-tth-detail'),
//     );
//     final responseMobileConfigAPI = await http.get(
//       Uri.parse('http://localhost:8000/api/mobile-config'),
//     );

//     if (responseCustomerAPI.statusCode == 200 &&
//         responseCustomerTTHAPI.statusCode == 200 &&
//         responseCustomerTTHDetailAPI.statusCode == 200 &&
//         responseMobileConfigAPI.statusCode == 200) {
//       List jsonResponseCustomerAPI =
//           jsonDecode(responseCustomerAPI.body)['data'];
//       List jsonResponseCustomerTTHAPI =
//           jsonDecode(responseCustomerTTHAPI.body)['data'];
//       List jsonResponseCustomerTTHDetailAPI =
//           jsonDecode(responseCustomerTTHDetailAPI.body)['data'];
//       List jsonResponseMobileConfigAPI =
//           jsonDecode(responseMobileConfigAPI.body)['data'];

//       Map<List, dynamic> jsonResponse = {
//         'customers': jsonResponseCustomerAPI
//             .map((data) => Customer.fromJson(data))
//             .toList(),
//         'customerTTHs': jsonResponseCustomerTTHAPI
//             .map((data) => CustomerTTH.fromJson(data))
//             .toList(),
//         'customerTTHDetails': jsonResponseCustomerTTHDetailAPI
//             .map((data) => CustomerTTHDetail.fromJson(data))
//             .toList(),
//         'mobileConfigs': jsonResponseMobileConfigAPI
//             .map((data) => MobileConfig.fromJson(data))
//             .toList(),
//       };

//       return jsonResponse;
//     } else {
//       throw Exception('Failed to load data from APIs');
//     }
//   }
// }
