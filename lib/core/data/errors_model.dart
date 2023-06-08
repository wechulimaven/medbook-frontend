/// statusCode : "Fail"
/// message : "Bad Request"
/// data : {"msg":"User already exists"}

class ErrorsModel {
  ErrorsModel({
    String? statusCode,
    String? message,
    Data? data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  ErrorsModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _statusCode;
  String? _message;
  Data? _data;
  ErrorsModel copyWith({
    String? statusCode,
    String? message,
    Data? data,
  }) =>
      ErrorsModel(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// msg : "User already exists"

class Data {
  Data({
    String? msg,
  }) {
    _msg = msg;
  }

  Data.fromJson(dynamic json) {
    _msg = json['message'];
  }
  String? _msg;
  Data copyWith({
    String? msg,
  }) =>
      Data(
        msg: msg ?? _msg,
      );
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _msg;
    return map;
  }
}
