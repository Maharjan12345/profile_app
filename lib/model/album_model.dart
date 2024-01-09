class Album {
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;

  Album({
    this.id,
    this.uid,
    this.password,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.avatar,
    this.gender,
    this.phoneNumber,
    this.socialInsuranceNumber,
    this.dateOfBirth,
    this.employment,
  });

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    socialInsuranceNumber = json['social_insurance_number'];
    dateOfBirth = json['date_of_birth'];
    employment = json['employment'] != null
        ? Employment.fromJson(json['employment'])
        : null;
    // employment = json['employment'] != null
    //     ? (json['employment'] as List)
    //         .map((e) => Employment.fromJson(e))
    //         .toList()
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['social_insurance_number'] = socialInsuranceNumber;
    data['date_of_birth'] = dateOfBirth;
    data['employment'] = employment!.toJson();
    // data['employment'] = employment!.map((e) => e.toJson()).toList();

    return data;
  }
}

class Employment {
  String? title;
  String? keySkill;

  Employment({this.title, this.keySkill});

  Employment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    keySkill = json['key_skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['key_skill'] = keySkill;
    return data;
  }
}
