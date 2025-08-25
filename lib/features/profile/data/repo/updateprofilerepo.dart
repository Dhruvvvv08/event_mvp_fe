import 'dart:io';

import 'package:event_demo_mac/core/network/bases.dart';
import 'package:event_demo_mac/core/network/error_handling.dart';
import 'package:http/http.dart';

import '../models/Profile_model.dart';

class Updateprofilerepo {
  Future<OnComplete<UpdateProfile>> updateprofile( Map<String, String> body,List<File> Images) async {
    try {
      ApiResponse response = await apiRequest(
        request: updateProfileFormData(url: "users/profile",fields: body, profileImages: Images),
      );

      if (response.success == true) {
        return OnComplete.success(UpdateProfile.fromJson(response.result));
      } else {
        return OnComplete.error(response.message ?? "Service Not Available");
      }
    } catch (e) {
      return OnComplete.error(e.toString());
    }
  }
}