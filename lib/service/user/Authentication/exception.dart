import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Widget excep(var e) {
  if (e is DioError) {
    // Handle Dio-specific errors
    if (e.error is SocketException) {
      throw Exception('Network error occurred.');
    } else if (e.response != null) {
      throw Exception(
          'Request failed with status code ${e.response!.statusCode}.');
    } else {
      throw Exception('An error occurred: ${e.error}');
    }
  } else {
    // Handle other exceptions
    throw Exception('An error occurred: $e');
  }
}
