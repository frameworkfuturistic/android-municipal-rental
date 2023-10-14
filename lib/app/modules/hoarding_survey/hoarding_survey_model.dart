class HoardingSurvey {
  int? id;
  String? hoardingLocation;
  String? longitude;
  String? latitude;
  String? image1;
  String? image2;
  int? length;
  int? width;
  String? hoardingType;
  String? userID;

  HoardingSurvey(
      {this.id,
      this.hoardingLocation,
      this.longitude,
      this.latitude,
      this.image1,
      this.image2,
      this.length,
      this.width,
      this.hoardingType,
      this.userID});

  HoardingSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hoardingLocation = json['hoardingLocation'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    image1 = json['Image1'];
    image2 = json['Image2'];
    length = json['Length'];
    width = json['Width'];
    hoardingType = json['hoardingType'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['hoardingLocation'] = hoardingLocation;
    data['Longitude'] = longitude;
    data['Latitude'] = latitude;
    data['Image1'] = image1;
    data['Image2'] = image2;
    data['Length'] = length;
    data['Width'] = width;
    data['hoardingType'] = hoardingType;
    data['UserID'] = userID;
    return data;
  }
}
