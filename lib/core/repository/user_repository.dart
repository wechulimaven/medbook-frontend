import 'dart:developer';

import 'package:fimber/fimber.dart';
import 'package:flutter/services.dart';

import '../data/errors_model.dart';
import '../data/requests_modelling/user_registration_request_model.dart';
import '../local_storage/shared_preference_helper.dart';
import '../network/api_provider.dart';
import '../network/endpoints.dart';

abstract class PatientRepository {
  Future<bool> isSignedIn();
  Future<PatientsModel?> registerUser(PatientsModel userRequestModel);

  Future<PatientsModel?> signInUser(String userEmail, String userPassword);
  Future<String?> signOut();
}

class PatientRepositoryImpl implements PatientRepository {
  final ApiProvider apiProvider;
  final SharedHelper sharedHelper;

  PatientRepositoryImpl({
    required this.apiProvider,
    required this.sharedHelper,
  });

  @override
  Future<bool> isSignedIn() async {
    var val = await sharedHelper.getAccessToken();
    if (val != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<PatientsModel?> registerUser(PatientsModel userRequestModel) async {
    try {
      final request = await apiProvider.post(
          userRequestModel.toJson(), EndPoints.register.url);

      if (request['status']) {
        PatientsModel userModel = PatientsModel.fromJson(request);
        // await sharedHelper.saveAccessToken("${userModel.token}");
        return userModel;
      } else {
        var error = ErrorsModel.fromJson(request);
        Fimber.e("User registration exception occured $request");
        throw '${error.data?.msg}';
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<PatientsModel?> signInUser(
    String userEmail,
    String userPassword,
  ) async {
    try {
      var request = await apiProvider.post(
          {"username": userEmail, "password": userPassword},
          EndPoints.detail.url);
      if (request['status']) {
        PatientsModel userModel = PatientsModel.fromJson(request);
        // await sharedHelper.saveAccessToken("${userModel.data?.token}");
        return userModel;
      } else {
        var error = ErrorsModel.fromJson(request);
        Fimber.e("User registration exception occured $request");
        throw '${error.data?.msg}';
      }
    } on PlatformException catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<String?> signOut() async {
    var request = await apiProvider.post({}, EndPoints.logout.url);
    if (request['status']) {
      await sharedHelper.clearStorage();
      return "User signed out successfully";
    } else {
      var error = ErrorsModel.fromJson(request);
      Fimber.e("User registration exception occured $request");
      throw '${error.data?.msg}';
    }
  }
}
