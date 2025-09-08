import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';
import 'api_response.dart';

abstract class BaseApiServices {
  Future<dynamic> fetchGetResponse(String url, {String token = ""});
  Future<dynamic> sendPostRequest(String url, dynamic data,
      {String? token = ""});
  Future<dynamic> sendPutRequest(String url, dynamic data);
  Future<dynamic> sendPatchRequest(String url, dynamic data);
  Future<dynamic> sendDeleteRequest(String url, dynamic data,
      {String? token = ""});
  Future<dynamic> sendMultipartRequest(
      String url, dynamic data, List<File> files,
      {String token = "", bool isWfh = false});

  // Future<dynamic> uploadMultipleFiles(String url, List<FileUploadModel> filesList, {String token = ""});
  Future<dynamic> uploadSingleFile(String url, File file, {String token = ""});
}

class NetworkApiService extends BaseApiServices {
  ApiResponses responseClass = ApiResponses();

  @override
  Future fetchGetResponse(String url, {String token = ""}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 300));
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      // FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      //FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e'); // Provide more detailed error message
    }
    return responseJson;
  }

  @override
  Future sendPostRequest(String url, dynamic data, {String? token = ""}) async {
    debugPrint('bearer: $token');

    dynamic responseJson;
    try {
      var head = token != ""
          ? {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            }
          : {'Content-Type': 'application/json'};
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data), headers: head)
          .timeout(const Duration(seconds: 500));
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      // FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      // FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e'); // Provide more detailed error message
    }
    debugPrint(responseJson.toString());
    return responseJson;
  }

  @override
  Future sendMultipartRequest(
    String url,
    dynamic data,
    List<File> files, {
    String token = "",
    bool isWfh = false,
  }) async {
    dynamic responseJson;
    try {
      Map<String, String> auth = {"Authorization": "Bearer $token"};
      http.MultipartFile multiPort;
      var request = http.MultipartRequest('POST', Uri.parse(url));
      for (var file in files) {
        var stream = http.ByteStream(file.openRead());
        stream.cast();
        var length = await file.length();
        multiPort = isWfh
            ? http.MultipartFile('attach_file', stream, length,
                filename: file.path)
            : http.MultipartFile('media', stream, length, filename: file.path);
        request.files.add(multiPort);
      }
      debugPrint(request.files.toString());
      request.fields.addAll(data);
      debugPrint(request.fields.toString());
      request.headers.addAll(auth);

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        dynamic decodedResponse = jsonDecode(responseBody);
        debugPrint(decodedResponse);

        responseJson = decodedResponse;
      } else {
        return null;
      }
    } on SocketException {
      //FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      //FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e'); // Provide more detailed error message
    }
    return responseJson;
  }

  @override
  Future sendPutRequest(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var response = await http.put(Uri.parse(url), body: data, headers: {
        "Content-Type": "application/json"
      }).timeout(const Duration(seconds: 10));
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      //FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      //FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e'); // Provide more detailed error message
    }
    return responseJson;
  }

  @override
  Future sendPatchRequest(String url, dynamic data,
      {String? token = ""}) async {
    dynamic responseJson;
    try {
      var head = token != ""
          ? {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            }
          : {'Content-Type': 'application/json'};

      var response = await http
          .patch(Uri.parse(url), body: data, headers: head)
          .timeout(const Duration(seconds: 10));
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      //FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      //FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e');
    }
    return responseJson;
  }

  @override
  Future sendDeleteRequest(String url, data, {String? token = ""}) async {
    dynamic responseJson;
    try {
      var head = token != ""
          ? {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            }
          : {'Content-Type': 'application/json'};

      var response = await http
          .delete(Uri.parse(url), body: jsonEncode(data), headers: head)
          .timeout(const Duration(seconds: 10));
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      //FirebaseCrashlytics.instance.recordError(FetchDataException('No Internet Connection'), StackTrace.current);
      throw FetchDataException('No Internet Connection');
    } catch (e, s) {
      // This will catch all other exceptions
      //FirebaseCrashlytics.instance.recordError(e, s); // Log every exception to Crashlytics
      throw FetchDataException(
          'Failed to send POST request due to an unexpected error: $e'); // Provide more detailed error message
    }
    return responseJson;
  }

  @override
  Future uploadSingleFile(String url, File file, {String token = ""}) {
    throw UnimplementedError();
  }
}
