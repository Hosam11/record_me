import 'package:get/get.dart';
import 'package:record_me/utils/services/api_service.dart';

String kApiUrl = ''; // GET

final ApiService _api = Get.find<ApiService>();

ApiService get api => _api;
