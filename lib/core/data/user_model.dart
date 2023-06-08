// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int? statusCode;
    bool? status;
    String? message;
    Data? data;

    UserModel({
        this.statusCode,
        this.status,
        this.message,
        this.data,
    });

    UserModel copyWith({
        int? statusCode,
        bool? status,
        String? message,
        Data? data,
    }) => 
        UserModel(
            statusCode: statusCode ?? this.statusCode,
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        statusCode: json["status_code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    User? user;
    String? token;

    Data({
        this.user,
        this.token,
    });

    Data copyWith({
        User? user,
        String? token,
    }) => 
        Data(
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    int? id;
    String? firstName;
    String? lastName;
    dynamic avatar;
    String? userId;
    String? accountType;
    dynamic idType;
    dynamic idNumber;
    String? displayName;
    DateTime? birthDate;
    String? countryCode;
    String? phoneNumber;
    String? country;
    dynamic businessName;
    dynamic businessPrimaryLocation;
    dynamic latitude;
    dynamic longitude;
    dynamic bio;
    String? email;
    String? gender;
    dynamic title;
    bool? isAccountVerified;
    bool? isIdentityVerified;
    bool? isBusinessAdded;
    bool? isServicesAdded;
    bool? isPortifolioAdded;
    bool? isBlacklisted;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.avatar,
        this.userId,
        this.accountType,
        this.idType,
        this.idNumber,
        this.displayName,
        this.birthDate,
        this.countryCode,
        this.phoneNumber,
        this.country,
        this.businessName,
        this.businessPrimaryLocation,
        this.latitude,
        this.longitude,
        this.bio,
        this.email,
        this.gender,
        this.title,
        this.isAccountVerified,
        this.isIdentityVerified,
        this.isBusinessAdded,
        this.isServicesAdded,
        this.isPortifolioAdded,
        this.isBlacklisted,
    });

    User copyWith({
        int? id,
        String? firstName,
        String? lastName,
        dynamic avatar,
        String? userId,
        String? accountType,
        dynamic idType,
        dynamic idNumber,
        String? displayName,
        DateTime? birthDate,
        String? countryCode,
        String? phoneNumber,
        String? country,
        dynamic businessName,
        dynamic businessPrimaryLocation,
        dynamic latitude,
        dynamic longitude,
        dynamic bio,
        String? email,
        String? gender,
        dynamic title,
        bool? isAccountVerified,
        bool? isIdentityVerified,
        bool? isBusinessAdded,
        bool? isServicesAdded,
        bool? isPortifolioAdded,
        bool? isBlacklisted,
    }) => 
        User(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            avatar: avatar ?? this.avatar,
            userId: userId ?? this.userId,
            accountType: accountType ?? this.accountType,
            idType: idType ?? this.idType,
            idNumber: idNumber ?? this.idNumber,
            displayName: displayName ?? this.displayName,
            birthDate: birthDate ?? this.birthDate,
            countryCode: countryCode ?? this.countryCode,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            country: country ?? this.country,
            businessName: businessName ?? this.businessName,
            businessPrimaryLocation: businessPrimaryLocation ?? this.businessPrimaryLocation,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            bio: bio ?? this.bio,
            email: email ?? this.email,
            gender: gender ?? this.gender,
            title: title ?? this.title,
            isAccountVerified: isAccountVerified ?? this.isAccountVerified,
            isIdentityVerified: isIdentityVerified ?? this.isIdentityVerified,
            isBusinessAdded: isBusinessAdded ?? this.isBusinessAdded,
            isServicesAdded: isServicesAdded ?? this.isServicesAdded,
            isPortifolioAdded: isPortifolioAdded ?? this.isPortifolioAdded,
            isBlacklisted: isBlacklisted ?? this.isBlacklisted,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        userId: json["user_id"],
        accountType: json["account_type"],
        idType: json["id_type"],
        idNumber: json["id_number"],
        displayName: json["display_name"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        countryCode: json["country_code"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        businessName: json["business_name"],
        businessPrimaryLocation: json["business_primary_location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        bio: json["bio"],
        email: json["email"],
        gender: json["gender"],
        title: json["title"],
        isAccountVerified: json["is_account_verified"],
        isIdentityVerified: json["is_identity_verified"],
        isBusinessAdded: json["is_business_added"],
        isServicesAdded: json["is_services_added"],
        isPortifolioAdded: json["is_portifolio_added"],
        isBlacklisted: json["is_blacklisted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "user_id": userId,
        "account_type": accountType,
        "id_type": idType,
        "id_number": idNumber,
        "display_name": displayName,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "country_code": countryCode,
        "phone_number": phoneNumber,
        "country": country,
        "business_name": businessName,
        "business_primary_location": businessPrimaryLocation,
        "latitude": latitude,
        "longitude": longitude,
        "bio": bio,
        "email": email,
        "gender": gender,
        "title": title,
        "is_account_verified": isAccountVerified,
        "is_identity_verified": isIdentityVerified,
        "is_business_added": isBusinessAdded,
        "is_services_added": isServicesAdded,
        "is_portifolio_added": isPortifolioAdded,
        "is_blacklisted": isBlacklisted,
    };
}
