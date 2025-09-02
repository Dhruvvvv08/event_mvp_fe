import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// import 'package:Devdoot/core/enums/user_role.dart';
// import 'package:Devdoot/core/services/storage_services.dart';
import 'package:event_demo_mac/core/constants/shared_pref.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

//In this file all the API requests are created, we will call these requests for all the APIs

//const String baseUrl = 'https://inspectionapi.austere.biz/inspection/api';
const String baseUrl = 'http://13.126.72.208:3500/';
http.Client client = http.Client();
// final LocalStorageService _storageService = LocalStorageService();
// final StorageService _storageService = StorageService();
//         Future<String?> _getToken() async {
//     // Get token using your existing StorageService
//     return _storageService.getToken(role: UserRole.endUser);
//   }
Map<String, String> appendAccessTokenWith(
  Map<String, String> headers,
  String accessToken,
) {
  final Map<String, String> requestHeaders = {
    'Authorization': accessToken,
    // 'Content-Type': "application/json",
    // 'cookie':
    //     "userId=s%3Aix4c7OINKAeyLCNR6sbcQP6SAbb6RLPp.md4VFFVZmDN2vl53Eivr6Ai7cOfT%2BeZuI9nLNEhPKy4; userId=s%3A9F6ACNKpmKUQhK004CIBCyL-_TTy8h2V.HxisbshJy0VpHPCYBcIjbGp%2Be9QqH%2FC1Ov%2Br3M3plH4"
  }..addAll(headers);
  return requestHeaders;
}

Future<http.Response> fetchData({
  required String url,
  String queryParams = "",
  bool isCustomUrl = false,
}) async {
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

 //final token = await _getToken();

  // if (addToken) {
  //   requestHeaders = appendAccessTokenWith({}, sessionToken);
  // }

  // else {
  // requestHeaders.addAll({'x-access-token': '${token ?? ""}'});
  // // }

  if (queryParams.isNotEmpty) {
    url += "?$queryParams";
  }

  final response = await client.get(
    isCustomUrl ? Uri.parse(url) : Uri.parse(baseUrl + url),
    headers: requestHeaders,
  );

  return response;
}



Future<http.Response> postDataa<T>({
  required String url,
  required T body,
}) async {
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  // final token = await _getToken();
  //String sessionToken = SharedPref.pref!.getString(Preferences.token) ?? "";

  // if (addToken) {
  //   requestHeaders = appendAccessTokenWith({}, sessionToken);
  // }

  // else {
  // requestHeaders.addAll({
  //   'x-access-token': '${token ?? ""}'
    
  //   });

  final response = await client.post(
    Uri.parse(baseUrl + url),
    headers: requestHeaders,
    body: jsonEncode(body),
  );

  return response;
}





Future<http.Response> postDataaRecuiter<T>({
  required String url,
  required T body,
}) async {
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  // final token = await _getToken();
  //String sessionToken = SharedPref.pref!.getString(Preferences.token) ?? "";

  // if (addToken) {
  //   requestHeaders = appendAccessTokenWith({}, sessionToken);
  // }

  // else {
  requestHeaders.addAll({
    'Authorization': '${'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1MzYyNDU2ZC0wNGJmLTRiMmQtOTJkMy04OGQ5ODc4MDkzYmQiLCJlbWFpbCI6Im1hZGFhbmRocnV2NTFAZ21haWwuY29tIiwiaWF0IjoxNzU2NjcwNTEzLCJleHAiOjE3NTY3NTY5MTN9.MI6q-ctxi54P3SC0XqNhNTOS0Sk5DCOAIOtAqCPqSJA' ?? ""}'
    
    });

  final response = await client.post(
    Uri.parse(baseUrl + url),
    headers: requestHeaders,
    body: jsonEncode(body),
  );

  return response;
}



Future<http.Response> updateProfileFormData({
  required String url,
  required Map<String, String> fields,
  required List<File> profileImages, // multiple images
}) async {
  String sessionToken = SharedPref.prefs!.getString(Prefrences.token) ?? "";

  var request = http.MultipartRequest("PUT", Uri.parse(baseUrl + url));

  // headers
  request.headers.addAll({
    'Authorization': 'Bearer $sessionToken',
    'Accept': 'application/json',
  });

  // add normal fields
  request.fields.addAll(fields);

  // add multiple images
for (var image in profileImages) {
  final bytes = await image.readAsBytes(); // read file as List<int>
  final mimeType = image.path.split('.').last.toLowerCase();

  request.files.add(
    http.MultipartFile.fromBytes(
      "profile_image",
      bytes,
      filename: image.path.split("/").last,
      contentType: MediaType('image', mimeType == 'png' ? 'png' : 'jpeg'),
    ),
  );
}

  var resp = await request.send();

  http.Response response = await http.Response.fromStream(resp);
  return response;
}


Future<http.Response> postDataawithouttoken<T>({
  required String url,
  required T body,
}) async {
  Map<String, String> requestHeaders;

  requestHeaders = {'Content-Type': 'application/json'};
  // requestHeaders.addAll({
  //   'Authorization':
  //       'Bearer ${SharedPref.pref!.getString(Preferences.login_token) ?? ""}'
  // });

  final response = await client.post(
    Uri.parse(baseUrl + url),
    headers: requestHeaders,
    body: jsonEncode(body),
  );

  return response;
}

Future<http.Response> postDataawithtoken<T>({
  required String url,
  required T body,
  String? token, // Add the token as an optional parameter
}) async {
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

  // If a token is provided, add it to the Authorization header
  // requestHeaders.addAll({
  //   'Authorization':
  //       'Bearer ${SharedPref.pref!.getString(Preferences.tokenn) ?? ""}'
  // });

  final response = await client.post(
    Uri.parse(baseUrl + url),
    headers: requestHeaders,
    body: jsonEncode(body),
  );

  return response;
}



Future<http.Response> uploadImageDataAndData({
  required Uint8List imageData,
  required String filename,
  required String url,
  required String district,
  required String block,
  required String school,
  required String programName,
}) async {
  final request = http.MultipartRequest("PUT", Uri.parse(baseUrl +'users/profile'));

  // request.headers.addAll(
  //     {'Authorization': SharedPref.pref!.getString(Preferences.token) ?? ""});

  request.files.add(
    http.MultipartFile.fromBytes(
      "file",
      imageData,
      filename: filename, // Use the provided filename for the image
    ),
  );

  request.fields["district"] = district;
  request.fields["block"] = block;
  request.fields["school"] = school;
  request.fields["program_name"] = programName;

  //-------Send request

  var resp = await request.send();

  http.Response response = await http.Response.fromStream(resp);
  return response;
}

Future<http.Response> uploadImageData({
  required Uint8List imageData,
  required String filename,
  required String url,
}) async {
  final request = http.MultipartRequest("POST", Uri.parse(url));

  request.files.add(
    http.MultipartFile.fromBytes(
      "file",
      imageData,
      filename: filename,
      contentType: MediaType(
        'image',
        'jpeg',
      ), // Use the provided filename for the image
    ),
  );

  //-------Send request

  var resp = await request.send();

  http.Response response = await http.Response.fromStream(resp);
  return response;
}

Future<http.Response> getdataaa({
  required String url,
  bool isCustomUrl = false,
  bool addToken = true,
}) async {
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

  //String sessionToken = SharedPref.pref!.getString(Preferences.token) ?? "";
 //final token = await _getToken();
  // if (addToken) {
  //   requestHeaders = appendAccessTokenWith({}, sessionToken);
  // }

  // else {
  // requestHeaders.addAll({
  //  'x-access-token': '${token ?? ""}'
    
  //   });
  // }

  final response = await client.get(
    isCustomUrl ? Uri.parse(url) : Uri.parse(baseUrl + url),
    headers: requestHeaders,
  );

  return response;
}

