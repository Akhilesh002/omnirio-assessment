class DataModel {
  String? firstname;
  Null storeDetails;
  String? countryNumberCode;
  Null sellerStoreId;
  bool? clickAndCollect;
  String? presentation;
  bool? loyaltyExclusive;
  String? sellerId;
  bool? pos;
  SellerDetails? sellerDetails;
  bool? isTest;
  String? email;
  int? pwdExpiredInDays;
  String? currencySymbol;
  int? roleId;
  String? currencyIso;
  bool? isPasswordExpiringSoon;
  String? roleCode;
  String? accessToken;
  String? userId;
  String? lastname;
  bool? loyaltyEnabled;
  bool? isPasswordExpired;
  bool? isFirstSignin;
  Null phone;
  String? defaultStoreId;
  String? response;
  bool? fulfillment;
  String? tokenType;
  String? defaultSmpId;

  DataModel(
      {this.firstname,
      this.storeDetails,
      this.countryNumberCode,
      this.sellerStoreId,
      this.clickAndCollect,
      this.presentation,
      this.loyaltyExclusive,
      this.sellerId,
      this.pos,
      this.sellerDetails,
      this.isTest,
      this.email,
      this.pwdExpiredInDays,
      this.currencySymbol,
      this.roleId,
      this.currencyIso,
      this.isPasswordExpiringSoon,
      this.roleCode,
      this.accessToken,
      this.userId,
      this.lastname,
      this.loyaltyEnabled,
      this.isPasswordExpired,
      this.isFirstSignin,
      this.phone,
      this.defaultStoreId,
      this.response,
      this.fulfillment,
      this.tokenType,
      this.defaultSmpId});

  DataModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    storeDetails = json['store_details'];
    countryNumberCode = json['country_number_code'];
    sellerStoreId = json['sellerStoreId'];
    clickAndCollect = json['click_and_collect'];
    presentation = json['presentation'];
    loyaltyExclusive = json['loyaltyExclusive'];
    sellerId = json['sellerId'];
    pos = json['pos'];
    sellerDetails = json['seller_details'] != null ? new SellerDetails.fromJson(json['seller_details']) : null;
    isTest = json['is_test'];
    email = json['email'];
    pwdExpiredInDays = json['pwd_expired_in_days'];
    currencySymbol = json['currency_symbol'];
    roleId = json['roleId'];
    currencyIso = json['currency_iso'];
    isPasswordExpiringSoon = json['is_password_expiring_soon'];
    roleCode = json['role_code'];
    accessToken = json['accessToken'];
    userId = json['userId'];
    lastname = json['lastname'];
    loyaltyEnabled = json['loyaltyEnabled'];
    isPasswordExpired = json['is_password_expired'];
    isFirstSignin = json['is_first_signin'];
    phone = json['phone'];
    defaultStoreId = json['default_store_id'];
    response = json['response'];
    fulfillment = json['fulfillment'];
    tokenType = json['tokenType'];
    defaultSmpId = json['default_smp_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['store_details'] = this.storeDetails;
    data['country_number_code'] = this.countryNumberCode;
    data['sellerStoreId'] = this.sellerStoreId;
    data['click_and_collect'] = this.clickAndCollect;
    data['presentation'] = this.presentation;
    data['loyaltyExclusive'] = this.loyaltyExclusive;
    data['sellerId'] = this.sellerId;
    data['pos'] = this.pos;
    if (this.sellerDetails != null) {
      data['seller_details'] = this.sellerDetails!.toJson();
    }
    data['is_test'] = this.isTest;
    data['email'] = this.email;
    data['pwd_expired_in_days'] = this.pwdExpiredInDays;
    data['currency_symbol'] = this.currencySymbol;
    data['roleId'] = this.roleId;
    data['currency_iso'] = this.currencyIso;
    data['is_password_expiring_soon'] = this.isPasswordExpiringSoon;
    data['role_code'] = this.roleCode;
    data['accessToken'] = this.accessToken;
    data['userId'] = this.userId;
    data['lastname'] = this.lastname;
    data['loyaltyEnabled'] = this.loyaltyEnabled;
    data['is_password_expired'] = this.isPasswordExpired;
    data['is_first_signin'] = this.isFirstSignin;
    data['phone'] = this.phone;
    data['default_store_id'] = this.defaultStoreId;
    data['response'] = this.response;
    data['fulfillment'] = this.fulfillment;
    data['tokenType'] = this.tokenType;
    data['default_smp_id'] = this.defaultSmpId;
    return data;
  }
}

class SellerDetails {
  String? sellerLogo;
  String? name;
  Null termConditionUrl;
  bool? isTermCondition;
  String? buisnessName;
  String? sellerId;

  SellerDetails({this.sellerLogo, this.name, this.termConditionUrl, this.isTermCondition, this.buisnessName, this.sellerId});

  SellerDetails.fromJson(Map<String, dynamic> json) {
    sellerLogo = json['seller_logo'];
    name = json['name'];
    termConditionUrl = json['term_condition_url'];
    isTermCondition = json['is_term_condition'];
    buisnessName = json['buisness_name'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_logo'] = this.sellerLogo;
    data['name'] = this.name;
    data['term_condition_url'] = this.termConditionUrl;
    data['is_term_condition'] = this.isTermCondition;
    data['buisness_name'] = this.buisnessName;
    data['seller_id'] = this.sellerId;
    return data;
  }
}
