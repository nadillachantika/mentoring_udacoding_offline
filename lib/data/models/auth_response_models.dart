import 'dart:convert';

class AuthResponseModel {
    final bool? success;
    final String? message;
    final AuthResponseModelData? data;

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
        data: json["data"] == null ? null : AuthResponseModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class AuthResponseModelData {
    final Headers? headers;
    final Original? original;
    final dynamic exception;

    AuthResponseModelData({
        this.headers,
        this.original,
        this.exception,
    });

    factory AuthResponseModelData.fromRawJson(String str) => AuthResponseModelData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponseModelData.fromJson(Map<String, dynamic> json) => AuthResponseModelData(
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
    final String? token;
    final OriginalData? data;

    Original({
        this.token,
        this.data,
    });

    factory Original.fromRawJson(String str) => Original.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        token: json["token"],
        data: json["data"] == null ? null : OriginalData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "data": data?.toJson(),
    };
}

class OriginalData {
    final int? id;
    final String? name;
    final String? roleId;
    final String? employeeId;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic phone;
    final dynamic emergencyContacts;
    final dynamic joinDate;
    final dynamic doB;
    final dynamic address;
    final dynamic bankAccount;
    final dynamic biography;
    final dynamic photo;
    final dynamic projectId;
    final dynamic taskId;
    final dynamic positionId;
    final dynamic createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    OriginalData({
        this.id,
        this.name,
        this.roleId,
        this.employeeId,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.emergencyContacts,
        this.joinDate,
        this.doB,
        this.address,
        this.bankAccount,
        this.biography,
        this.photo,
        this.projectId,
        this.taskId,
        this.positionId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory OriginalData.fromRawJson(String str) => OriginalData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OriginalData.fromJson(Map<String, dynamic> json) => OriginalData(
        id: json["id"],
        name: json["name"],
        roleId: json["role_id"],
        employeeId: json["employee_id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        emergencyContacts: json["emergency_contacts"],
        joinDate: json["join_date"],
        doB: json["DoB"],
        address: json["address"],
        bankAccount: json["bank_account"],
        biography: json["biography"],
        photo: json["photo"],
        projectId: json["project_id"],
        taskId: json["task_id"],
        positionId: json["position_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role_id": roleId,
        "employee_id": employeeId,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "emergency_contacts": emergencyContacts,
        "join_date": joinDate,
        "DoB": doB,
        "address": address,
        "bank_account": bankAccount,
        "biography": biography,
        "photo": photo,
        "project_id": projectId,
        "task_id": taskId,
        "position_id": positionId,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
