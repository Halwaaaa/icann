import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/services/servicesDio.dart';

class RemoteStore {
  final ServicesDio servicesDio;
  RemoteStore(this.servicesDio);
  Future<void> getWarehouse() async {
    Map<String, dynamic>? h =
        await servicesDio.getRequestWithToken('warehouses');

    print(h?['data']);
  }
}
