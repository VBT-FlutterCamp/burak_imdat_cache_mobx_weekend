import '../../product/service/service_cosntant.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  late BuildContext context;
  final INetworkManager manager = ServiceConstant.instance.networkManager;
  void setContext(BuildContext context);
  void init();
}
