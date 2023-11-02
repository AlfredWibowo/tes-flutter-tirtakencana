import 'package:get/get.dart';
import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:test_flutter_tirtakencana/services/customer_service.dart';

class CustomerController extends GetxController {
  var isLoading = false.obs;
  var customers = <Customer>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      isLoading(true);
      final customerService = CustomerService();
      final customerList = await customerService.getCustomers();
      customers.assignAll(customerList);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void updateData(Customer customer, int received, String failedReason) async {
    try {
      isLoading(true);
      final customerService = CustomerService();
      await customerService.updateCustomer(customer, received, failedReason);
      final updatedCustomerList = await customerService.getCustomers();
      customers.assignAll(updatedCustomerList);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
