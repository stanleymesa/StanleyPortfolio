import 'dart:convert';

BaseResponse baseResponseFromJson(String str) => BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  int? code;
  bool? error;
  String? message;
  String? data;

  BaseResponse({
    this.code,
    this.error = false,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    data: jsonEncode(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "data": data,
  };
}