import 'dart:convert';

class GetProfileResponseModel {
    final User? user;
    final String? token;
    final String? status;

    GetProfileResponseModel({
        this.user,
        this.token,
        this.status,
    });

    factory GetProfileResponseModel.fromRawJson(String str) => GetProfileResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) => GetProfileResponseModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
        "status": status,
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final DateTime? emailVerifiedAt;
    final dynamic twoFactorSecret;
    final dynamic twoFactorRecoveryCodes;
    final dynamic twoFactorConfirmedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic phone;
    final String? role;
    final String? position;
    final String? department;
    final String? faceEmbedding;
    final String? imageUrl;
    final String? profileImage;

    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.twoFactorSecret,
        this.twoFactorRecoveryCodes,
        this.twoFactorConfirmedAt,
        this.createdAt,
        this.updatedAt,
        this.phone,
        this.role,
        this.position,
        this.department,
        this.faceEmbedding,
        this.imageUrl,
        this.profileImage,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        role: json["role"],
        position: json["position"],
        department: json["department"],
        faceEmbedding: json["face_embedding"],
        imageUrl: json["image_url"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "phone": phone,
        "role": role,
        "position": position,
        "department": department,
        "face_embedding": faceEmbedding,
        "image_url": imageUrl,
        "profile_image": profileImage,
    };
}
