class Links {
  String privacyPolicy;
  String termsOfUse;

  Links({required this.privacyPolicy, required this.termsOfUse});

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy_policy'] = this.privacyPolicy;
    data['terms_of_use'] = this.termsOfUse;
    return data;
  }
}
