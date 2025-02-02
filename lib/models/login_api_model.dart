class LoginApiModel {
  bool? status;
  String? message;
  int? isMobileVerified;
  int? isEmailVerified;
  String? deviceToken;
  String? token;

  LoginApiModel(
      {this.status,
      this.message,
      this.isMobileVerified,
      this.isEmailVerified,
      this.deviceToken,
      this.token});

  LoginApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isMobileVerified = json['is_mobile_verified'];
    isEmailVerified = json['is_email_verified'];
    deviceToken = json['device_token'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['device_token'] = this.deviceToken;
    data['token'] = this.token;
    return data;
  }
}
