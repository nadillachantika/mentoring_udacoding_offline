import 'dart:convert';

class AuthResponseModel {
    final bool? success;
    final String? message;
    final Data? data;

    AuthResponseModel({
        this.success,
        this.message,
        this.data,
    });

    factory AuthResponseModel.fromRawJson(String str) => AuthResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final Headers? headers;
    final Original? original;
    final dynamic exception;

    Data({
        this.headers,
        this.original,
        this.exception,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null ? null : Original.fromJson(json["original"]),
        exception: json["exception"],
    );

    Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
    };
}

class Headers {
    Headers();

    factory Headers.fromRawJson(String str) => Headers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Original {
    final String? message;

    Original({
        this.message,
    });

    factory Original.fromRawJson(String str) => Original.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
