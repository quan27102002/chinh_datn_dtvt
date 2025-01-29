import 'package:datn_trung/provider/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppFunction {
  static showLoading(BuildContext context) {
    context.read<LoadingProvider>().showLoading();
  }

  static hideLoading(BuildContext context) {
    context.read<LoadingProvider>().hideLoading();
  }
}
