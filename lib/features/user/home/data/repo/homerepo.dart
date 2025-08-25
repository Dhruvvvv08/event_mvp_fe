// class Homerepo {
//   Future<OnComplete<UpdateProfile>> updateprofile( Map<String, String> body,List<File> Images) async {
//     try {
//       ApiResponse response = await apiRequest(
//         request: updateProfileFormData(url: "users/profile",fields: body, profileImages: Images),
//       );

//       if (response.success == true) {
//         return OnComplete.success(UpdateProfile.fromJson(response.result));
//       } else {
//         return OnComplete.error(response.message ?? "Service Not Available");
//       }
//     } catch (e) {
//       return OnComplete.error(e.toString());
//     }
//   }
// }