import 'package:get/get.dart';
import 'package:test_flutter_tirtakencana/models/mobile_config.dart';
import 'package:test_flutter_tirtakencana/services/mobile_config_service.dart';

class MobileConfigController extends GetxController {
  var isLoading = false.obs;
  var mobileConfigs = <MobileConfig>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      isLoading(true);
      final mobileConfigService = MobileConfigService();
      final mobileConfigList = await mobileConfigService.getMobileConfigs();
      mobileConfigs.assignAll(mobileConfigList);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
