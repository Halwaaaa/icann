import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';

class SearchRemto {
  final ServicesDio servicesDio;
  SearchRemto(this.servicesDio);

  Future<List<OrderModels>?> getSaerch(
      int? country_id,
      int? state_id,
      String? from_date,
      String? to_date,
      String? client_name,
      String? client_phone,
      int? order_number) async {
    Map<String, dynamic>? respincv = await servicesDio.getRequestWithToken(
        'orders/search?country_id= $country_id & state_id=$state_id&from_date=$from_date &to_date=$to_date&client_name=$client_name&client_phone=$client_phone&order_number=101');
    List<dynamic> responcvData = respincv?['data'];
    print(responcvData);
    List<OrderModels>? order = [];
    responcvData.forEachIndexed((index, element) async {
      order.add(OrderModels.fromJson(element));
      //   CountersUser countersUser = CountersUser.fromJson(element);
      //   countres.add(countersUser);
    });
    return order;
  }
}
