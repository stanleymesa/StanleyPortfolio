import 'dart:convert';

BaseListResponse baseListResponseFromJson(String str) =>
    BaseListResponse.fromJson(json.decode(str));

String baseListResponseToJson(BaseListResponse data) =>
    json.encode(data.toJson());

class BaseListResponse {
  int? code;
  bool? error;
  String? message;
  List<String>? data;
  int? arrayCount;
  int? totalItems;
  int? pageSize;
  bool? isHasNextPage;

  BaseListResponse({
    this.code,
    this.error = false,
    this.message,
    this.data,
    this.arrayCount,
    this.totalItems,
    this.pageSize,
    this.isHasNextPage,
  });

  factory BaseListResponse.fromJson(Map<String, dynamic> json) =>
      BaseListResponse(
        code: json["code"],
        error: json["error"],
        message: json["message"],
        data: List<String>.from((json['data'] ?? []).map((x) => jsonEncode(x))),
        arrayCount: json["arrayCount"],
        totalItems: json["totalItems"],
        pageSize: json["pageSize"],
        isHasNextPage: json["isHasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "error": error,
        "message": message,
        "data": List<dynamic>.from((data ?? []).map((x) => x)),
        "arrayCount": arrayCount,
        "totalItems": totalItems,
        "pageSize": pageSize,
        "isHasNextPage": isHasNextPage,
      };
}
