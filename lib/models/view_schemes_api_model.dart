import 'dart:convert';

class ViewSchemesApiModel {
  bool? status;
  Result? result;

  ViewSchemesApiModel({this.status, this.result});

  ViewSchemesApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Properties? properties;
  SchemeDetail? schemeDetail;

  Result({this.properties, this.schemeDetail});

  Result.fromJson(Map<String, dynamic> json) {
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    schemeDetail = json['scheme_detail'] != null
        ? new SchemeDetail.fromJson(json['scheme_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.schemeDetail != null) {
      data['scheme_detail'] = this.schemeDetail!.toJson();
    }
    return data;
  }
}

class Properties {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Properties(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Properties.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? bookingTime;
  String? propertyPublicId;
  Null? description;
  Null? otherInfo;
  String? schemePublicId;
  String? plotType;
  String? plotName;
  String? schemeName;
  String? plotNo;
  int? schemeId;
  int? propertyStatus;
  AttributesData? attributesData;
  String? userId;
  String? cancelTime;
  int? managementHold;

  Data(
      {this.bookingTime,
      this.propertyPublicId,
      this.description,
      this.otherInfo,
      this.schemePublicId,
      this.plotType,
      this.plotName,
      this.schemeName,
      this.plotNo,
      this.schemeId,
      this.propertyStatus,
      this.attributesData,
      this.userId,
      this.cancelTime,
      this.managementHold});

  Data.fromJson(Map<String, dynamic> json) {
    bookingTime = json['booking_time'];
    propertyPublicId = json['property_public_id'];
    description = json['description'];
    otherInfo = json['other_info'];
    schemePublicId = json['scheme_public_id'];
    plotType = json['plot_type'];
    plotName = json['plot_name'];
    schemeName = json['scheme_name'];
    plotNo = json['plot_no'];
    schemeId = json['scheme_id'];
    propertyStatus = json['property_status'];
   // attributesData = json['attributes_data'];
    attributesData=AttributesData.fromJson(
      json['attributes_data'] != null ? jsonDecode(json['attributes_data']) : {},
    );
   // attributesData =  parseJsonString (json['attributes_data'].toString());
    userId = json['user_id'];
    cancelTime = json['cancel_time'];
    managementHold = json['management_hold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_time'] = this.bookingTime;
    data['property_public_id'] = this.propertyPublicId;
    data['description'] = this.description;
    data['other_info'] = this.otherInfo;
    data['scheme_public_id'] = this.schemePublicId;
    data['plot_type'] = this.plotType;
    data['plot_name'] = this.plotName;
    data['scheme_name'] = this.schemeName;
    data['plot_no'] = this.plotNo;
    data['scheme_id'] = this.schemeId;
    data['property_status'] = this.propertyStatus;
    data['attributes_data'] = this.attributesData;
    data['user_id'] = this.userId;
    data['cancel_time'] = this.cancelTime;
    data['management_hold'] = this.managementHold;
    return data;
  }
}

class AttributesData {
  String? no;
  String? sizeSqMtr;
  String? sizeSqYrds;
  String? slableAreaSqYrd;
  String? facing;
  String? roadSize;

  AttributesData(
      {this.no,
      this.sizeSqMtr,
      this.sizeSqYrds,
      this.slableAreaSqYrd,
      this.facing,
      this.roadSize});

  AttributesData.fromJson(Map<String, dynamic> json) {
    no = json['No.'];
    sizeSqMtr = json['Size (Sq. Mtr)'];
    sizeSqYrds = json['Size (Sq. Yrds)'];
    slableAreaSqYrd = json['Slable Area (Sq. Yrd)'];
    facing = json['Facing'];
    roadSize = json['Road size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['No.'] = this.no;
    data['Size (Sq. Mtr)'] = this.sizeSqMtr;
    data['Size (Sq. Yrds)'] = this.sizeSqYrds;
    data['Slable Area (Sq. Yrd)'] = this.slableAreaSqYrd;
    data['Facing'] = this.facing;
    data['Road size'] = this.roadSize;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class SchemeDetail {
  int? id;
  String? publicId;
  String? productionId;
  String? schemeName;
  String? schemeImg;
  String? brochure;
  Null? ppt;
  Null? video;
  Null? jdaMap;
  Null? pra;
  Null? otherDocs;
  String? schemeImages;
  String? location;
  int? noOfPlot;
  String? schemeDescription;
  String? bankName;
  int? accountNumber;
  String? ifscCode;
  String? branchName;
  String? team;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? holdStatus;
  String? lunchDate;

  SchemeDetail(
      {this.id,
      this.publicId,
      this.productionId,
      this.schemeName,
      this.schemeImg,
      this.brochure,
      this.ppt,
      this.video,
      this.jdaMap,
      this.pra,
      this.otherDocs,
      this.schemeImages,
      this.location,
      this.noOfPlot,
      this.schemeDescription,
      this.bankName,
      this.accountNumber,
      this.ifscCode,
      this.branchName,
      this.team,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.holdStatus,
      this.lunchDate});

  SchemeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publicId = json['public_id'];
    productionId = json['production_id'];
    schemeName = json['scheme_name'];
    schemeImg = json['scheme_img'];
    brochure = json['brochure'];
    ppt = json['ppt'];
    video = json['video'];
    jdaMap = json['jda_map'];
    pra = json['pra'];
    otherDocs = json['other_docs'];
    schemeImages = json['scheme_images'];
    location = json['location'];
    noOfPlot = json['no_of_plot'];
    schemeDescription = json['scheme_description'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    branchName = json['branch_name'];
    team = json['team'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    holdStatus = json['hold_status'];
    lunchDate = json['lunch_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['public_id'] = this.publicId;
    data['production_id'] = this.productionId;
    data['scheme_name'] = this.schemeName;
    data['scheme_img'] = this.schemeImg;
    data['brochure'] = this.brochure;
    data['ppt'] = this.ppt;
    data['video'] = this.video;
    data['jda_map'] = this.jdaMap;
    data['pra'] = this.pra;
    data['other_docs'] = this.otherDocs;
    data['scheme_images'] = this.schemeImages;
    data['location'] = this.location;
    data['no_of_plot'] = this.noOfPlot;
    data['scheme_description'] = this.schemeDescription;
    data['bank_name'] = this.bankName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['branch_name'] = this.branchName;
    data['team'] = this.team;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['hold_status'] = this.holdStatus;
    data['lunch_date'] = this.lunchDate;
    return data;
  }
}
Map<String, dynamic> parseJsonString(String jsonString) {
  return jsonDecode(jsonString);
}