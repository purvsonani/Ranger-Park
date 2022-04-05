import 'package:ranger_park/api/api.dart';
import 'package:ranger_park/api/api_endpoints.dart';
import 'package:ranger_park/api/api_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ranger_park/models/parks_list_response.dart';
import 'package:ranger_park/models/question_details_response.dart';
import 'package:ranger_park/models/ranger_details_response.dart';
import 'package:ranger_park/models/rewards_response.dart';

import '../../models/park_details_response.dart';

ApiRepository apiRepository = ApiRepository();

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
      // print(response.data.toString());
      return ParkListResponse.fromJson(response.data);
    } on Exception catch (e) {
      print("************getParkList() Exception************");
      return ParkListResponse.withError(error: 0);
    }
  }

  Future<ParkDetailsResponse> getParkDetails({required int park_id}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("************No Internet Connectivity************");
      return ParkDetailsResponse.withError(error: 0);
    }
    final url = Api.baseUrl + ApiEndPoints.GET_PARK_DETAILS;
    Map<String, dynamic> queryParameters = {"park_id": park_id};

    try {
      final response =
          await _apiUtils.post(url: url, queryParameters: queryParameters);
      // print(response.data.toString());
      return ParkDetailsResponse.fromJson(response.data);
    } on Exception catch (e) {
      print("************getParkDetails() Exception************");
      return ParkDetailsResponse.withError(error: 0);
    }
  }

  Future<QuestionDetailsResponse> getQuestionDetails(
      {required int question_id}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("************No Internet Connectivity************");
      return QuestionDetailsResponse.withError(error: 0);
    }
    final url = Api.baseUrl + ApiEndPoints.GET_QUESTION_DETAILS;
    Map<String, dynamic> queryParameters = {
      "question_id": question_id,
    };

    try {
      final response =
          await _apiUtils.post(url: url, queryParameters: queryParameters);
      // print(response.data.toString());
      return QuestionDetailsResponse.fromJson(response.data);
    } on Exception catch (e) {
      print("************getParkDetails() Exception************");
      return QuestionDetailsResponse.withError(error: 0);
    }
  }

  Future<RangerDetailsResponse> getRangerDetails(
      {required int ranger_id}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("************No Internet Connectivity************");
      return RangerDetailsResponse.withError(error: 0);
    }
    final url = Api.baseUrl + ApiEndPoints.GET_RANGER_DETAILS;
    Map<String, dynamic> queryParameters = {
      "ranger_id": ranger_id,
    };

    try {
      final response =
      await _apiUtils.post(url: url, queryParameters: queryParameters);
      // print(response.data.toString());
      return RangerDetailsResponse.fromJson(response.data);
    } on Exception catch (e) {
      print("************getRangerDetails() Exception************");
      return RangerDetailsResponse.withError(error: 0);
    }
  }

  Future<RewardsResponse> getRewards() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("************No Internet Connectivity************");
      return RewardsResponse.withError(error: 1);
    }
    final url = Api.baseUrl + ApiEndPoints.GET_REWARD;

    try {
      final response = await _apiUtils.get(url: url);
      // print(response.data.toString());
      return RewardsResponse.fromJson(response.data);
    } on Exception catch (e) {
      print("************getParkList() Exception************");
      return RewardsResponse.withError(error: 0);
    }
  }
}
