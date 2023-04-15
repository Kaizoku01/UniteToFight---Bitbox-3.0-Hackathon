import 'dart:core';
// import 'dart:io';

class ProtestSchema {
  String? post_name;
  String? description;
  String? location;
  DateTime? date; // dd/mm/yyyy format
  int? likes;
  var RSVP;
  String? comments;

  ProtestSchema(
      {this.post_name,
      this.description,
      this.location,
      this.date,
      this.likes,
      this.comments});

  factory ProtestSchema.fromMap(Map<String?, dynamic> mp) {
    return ProtestSchema(
      post_name: mp['post_name'],
      description: mp['description'],
      location: mp['location'],
      date: DateTime.tryParse(mp['date']),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "post_name": post_name,
      "description": description,
      "location": location,
      "date": date!.toIso8601String()
    };
  }
}

class CommentSchema {
  UserSchema obj = UserSchema();
  String? author;
  String? text;
  CommentSchema() {
    author = obj.user_name;
  }
  // CommentSchema(this.author, this.text);
}

class UserSchema {
  String? user_name;
  String? email_id;
  String? password;
  String? role;
  String? gender;
  bool? isemailverified;
  List<int> post_history = [];
  String? post_details;
  String? image;

  UserSchema(
      {this.user_name,
      this.email_id,
      this.password,
      this.gender,
      this.role,
      this.isemailverified,
      this.post_details,
      this.image});

  factory UserSchema.fromMap(Map<String?, dynamic> mp) {
    return UserSchema(
      user_name: mp['user_name'],
      email_id: mp['email_id'],
      password: mp['password'],
      gender: mp['gender'],
      role: mp['role'],
      isemailverified: mp['isemailverified'],
      post_details: mp['post_details'],
      image: mp['image'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "user_name": user_name,
      "email_id": email_id,
      "gender": gender,
      "role": role,
      "isemailverified": isemailverified,
      "post_details": post_details,
      "image": image,
    };
  }
}

class tokenSchema {
  String? token;
  var user = UserSchema();
  String? type;
  DateTime? expires;
  bool? blacklisted;
}

void main() {}
