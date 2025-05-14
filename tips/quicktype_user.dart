import 'dart:convert';

class User {
    final int? userId;
    final String? email;
    final String? displayName;
    final bool? isActive;
    final String? firstName;
    final String? lastName;
    final List<String>? roles;
    final Preferences? preferences;

    User({
        this.userId,
        this.email,
        this.displayName,
        this.isActive,
        this.firstName,
        this.lastName,
        this.roles,
        this.preferences,
    });

    User copyWith({
        int? userId,
        String? email,
        String? displayName,
        bool? isActive,
        String? firstName,
        String? lastName,
        List<String>? roles,
        Preferences? preferences,
    }) => 
        User(
            userId: userId ?? this.userId,
            email: email ?? this.email,
            displayName: displayName ?? this.displayName,
            isActive: isActive ?? this.isActive,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            roles: roles ?? this.roles,
            preferences: preferences ?? this.preferences,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        email: json["email"],
        displayName: json["displayName"],
        isActive: json["isActive"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
        preferences: json["preferences"] == null ? null : Preferences.fromJson(json["preferences"]),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "displayName": displayName,
        "isActive": isActive,
        "firstName": firstName,
        "lastName": lastName,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
        "preferences": preferences?.toJson(),
    };
}

class Preferences {
    final String? language;
    final String? theme;

    Preferences({
        this.language,
        this.theme,
    });

    Preferences copyWith({
        String? language,
        String? theme,
    }) => 
        Preferences(
            language: language ?? this.language,
            theme: theme ?? this.theme,
        );

    factory Preferences.fromRawJson(String str) => Preferences.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        language: json["language"],
        theme: json["theme"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "theme": theme,
    };
}
