import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';


class ApiResponses {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
      case 406:
      case 409:
        return jsonDecode(response.body);

      case 401:
        return {
          "success": false,
          "message": "Unauthorized request",
        };

      case 404:
        throw UnauthorisedException("Not found");

      case 422:
        throw UnauthorisedException("Invalid input");

      case 500:
        return {
          "success": false,
          "message": "Internal Server Error",
        };

      default:
        throw FetchDataException(
          "Error communicating with server (status code: ${response.statusCode})",
        );
    }
  }


}

class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.toString();
    } else if (error is FormatException) {
      return "Invalid response format";
    } else if (error is Map<String, dynamic>) {
      return error["message"]?.toString()
          ?? error["response"]?.toString()
          ?? "Something went wrong";
    } else {
      return error?.toString() ?? "Something went wrong";
    }
  }
}


