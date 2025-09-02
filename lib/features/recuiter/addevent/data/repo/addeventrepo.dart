import 'package:event_demo_mac/core/network/bases.dart';
import 'package:event_demo_mac/core/network/error_handling.dart';

import '../models/addevent.dart';

class Addeventrepo {
    Future<OnComplete<AddEvent>> uploadevent(final Map body) async {
    try {
      ApiResponse response = await apiRequest(
        request: postDataaRecuiter(body: body,url: "post"),
      );

      if (response.success == true) {
        return OnComplete.success(AddEvent.fromJson(response.result));
      } else {
        return OnComplete.error(response.message ?? "Service Not Available");
      }
    } catch (e) {
      return OnComplete.error(e.toString());
    }
  }
}
