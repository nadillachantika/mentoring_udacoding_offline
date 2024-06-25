import 'dart:convert';

class GetProfileResponseModel {
    final bool? success;
    final String? message;
    final Data? data;

    GetProfileResponseModel({
        this.success,
        this.message,
        this.data,
    });

    factory GetProfileResponseModel.fromRawJson(String str) => GetProfileResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) => GetProfileResponseModel(
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
    final int? id;
    final String? name;
    final String? email;
    final String? roleId;
    final String? employeeId;
    final dynamic phone;
    final dynamic photo;
    final dynamic positionId;
    final dynamic createdAt;
    final DateTime? updatedAt;

    Data({
        this.id,
        this.name,
        this.email,
        this.roleId,
        this.employeeId,
        this.phone,
        this.photo,
        this.positionId,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roleId: json["role_id"],
        employeeId: json["employee_id"],
        phone: json["phone"],
        photo: json["photo"],
        positionId: json["position_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role_id": roleId,
        "employee_id": employeeId,
        "phone": phone,
        "photo": photo,
        "position_id": positionId,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}
