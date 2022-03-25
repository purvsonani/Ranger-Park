import 'package:flutter/cupertino.dart';
import 'package:ranger_park/api/api.dart';
import 'package:ranger_park/api/api_endpoints.dart';
import 'package:ranger_park/api/api_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ranger_park/models/parks_list_response.dart';

class ApiRepository {
  ApiUtils _apiUtils = ApiUtils();

  Future<ParkListResponse> getParkList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("************No Internet Connectivity************");
      return ParkListResponse.withError(error: 1);
    }
      final url = Api.baseUrl + ApiEndPoints.GET_PARK_LIST;

      try {
        final response = await _apiUtils.get(url: url);
        print(response.data.toString());
        return ParkListResponse.fromJson(response.data);
      } on Exception catch (e) {
        print("************getParkList() Exception************");
        return ParkListResponse.withError(error: 0);
      }

  }
}
