class ShopSurvey {
  int? id;
  dynamic circle;
  dynamic interviewee;
  dynamic relation;
  dynamic licenseeName;
  dynamic licenseeFather;
  String? address;
  dynamic locality;
  dynamic allotmentNo;
  dynamic allotmentDate;
  dynamic shopName;
  dynamic shopNo;
  dynamic plotNo;
  dynamic holdingNo;
  dynamic buildingType;
  dynamic floor;
  String? areaName;
  String? latitude;
  String? longitude;
  dynamic email;
  dynamic gST;
  String? image1;
  String? image2;
  String? userID;

  ShopSurvey(
      {this.id,
      this.circle,
      this.interviewee,
      this.relation,
      this.licenseeName,
      this.licenseeFather,
      this.address,
      this.locality,
      this.allotmentNo,
      this.allotmentDate,
      this.shopName,
      this.shopNo,
      this.plotNo,
      this.holdingNo,
      this.buildingType,
      this.floor,
      this.areaName,
      this.latitude,
      this.longitude,
      this.email,
      this.gST,
      this.image1,
      this.image2,
      this.userID});

  ShopSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    circle = json['Circle'];
    interviewee = json['Interviewee'];
    relation = json['Relation'];
    licenseeName = json['LicenseeName'];
    licenseeFather = json['LicenseeFather'];
    address = json['Address'];
    locality = json['Locality'];
    allotmentNo = json['AllotmentNo'];
    allotmentDate = json['AllotmentDate'];
    shopName = json['ShopName'];
    shopNo = json['ShopNo'];
    plotNo = json['PlotNo'];
    holdingNo = json['HoldingNo'];
    buildingType = json['BuildingType'];
    floor = json['Floor'];
    areaName = json['AreaName'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    email = json['Email'];
    gST = json['GST'];
    image1 = json['Image1'];
    image2 = json['Image2'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['Circle'] = circle;
    data['Interviewee'] = interviewee;
    data['Relation'] = relation;
    data['LicenseeName'] = licenseeName;
    data['LicenseeFather'] = licenseeFather;
    data['Address'] = address;
    data['Locality'] = locality;
    data['AllotmentNo'] = allotmentNo;
    data['AllotmentDate'] = allotmentDate;
    data['ShopName'] = shopName;
    data['ShopNo'] = shopNo;
    data['PlotNo'] = plotNo;
    data['HoldingNo'] = holdingNo;
    data['BuildingType'] = buildingType;
    data['Floor'] = floor;
    data['AreaName'] = areaName;
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    data['Email'] = email;
    data['GST'] = gST;
    data['Image1'] = image1;
    data['Image2'] = image2;
    data['UserID'] = userID;
    return data;
  }
}
