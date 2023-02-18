class ApplicationFormModel {
  String? postAppliedFor;
  String? howHeardVacancy;
  PersonalDetail? personalDetail;
  Convictions? convictions;
  Address? address;
  NextOfKin? nextOfKin;
  NmcDetail? nmcDetail;
  DbsDetail? dbsDetail;
  List<Employment>? employment;
  Covid19? covid19;
  BankDetails? bankDetails;
  HealthConditions? healthConditions;
  TimeRegulations? timeRegulations;
  Decleration? decleration;

  ApplicationFormModel(
      {this.postAppliedFor,
        this.howHeardVacancy,
        this.personalDetail,
        this.convictions,
        this.address,
        this.nextOfKin,
        this.nmcDetail,
        this.dbsDetail,
        this.employment,
        this.covid19,
        this.bankDetails,
        this.healthConditions,
        this.timeRegulations,
        this.decleration});

  ApplicationFormModel.fromJson(Map<String, dynamic> json) {
    postAppliedFor = json['post_applied_for'];
    howHeardVacancy = json['how_heard_vacancy'];
    personalDetail = json['personal_detail'] != null
        ? new PersonalDetail.fromJson(json['personal_detail'])
        : null;
    convictions = json['convictions'] != null
        ? new Convictions.fromJson(json['convictions'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    nextOfKin = json['next_of_kin'] != null
        ? new NextOfKin.fromJson(json['next_of_kin'])
        : null;
    nmcDetail = json['nmc_detail'] != null
        ? new NmcDetail.fromJson(json['nmc_detail'])
        : null;
    dbsDetail = json['dbs_detail'] != null
        ? new DbsDetail.fromJson(json['dbs_detail'])
        : null;
    if (json['employment'] != null) {
      employment = <Employment>[];
      json['employment'].forEach((v) {
        employment!.add(new Employment.fromJson(v));
      });
    }
    covid19 = json['covid_19'] != null
        ? new Covid19.fromJson(json['covid_19'])
        : null;
    bankDetails = json['bank_details'] != null
        ? new BankDetails.fromJson(json['bank_details'])
        : null;
    healthConditions = json['health_conditions'] != null
        ? new HealthConditions.fromJson(json['health_conditions'])
        : null;
    timeRegulations = json['time_regulations'] != null
        ? new TimeRegulations.fromJson(json['time_regulations'])
        : null;
    decleration = json['decleration'] != null
        ? new Decleration.fromJson(json['decleration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_applied_for'] = this.postAppliedFor;
    data['how_heard_vacancy'] = this.howHeardVacancy;
    if (this.personalDetail != null) {
      data['personal_detail'] = this.personalDetail!.toJson();
    }
    if (this.convictions != null) {
      data['convictions'] = this.convictions!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.nextOfKin != null) {
      data['next_of_kin'] = this.nextOfKin!.toJson();
    }
    if (this.nmcDetail != null) {
      data['nmc_detail'] = this.nmcDetail!.toJson();
    }
    if (this.dbsDetail != null) {
      data['dbs_detail'] = this.dbsDetail!.toJson();
    }
    if (this.employment != null) {
      data['employment'] = this.employment!.map((v) => v.toJson()).toList();
    }
    if (this.covid19 != null) {
      data['covid_19'] = this.covid19!.toJson();
    }
    if (this.bankDetails != null) {
      data['bank_details'] = this.bankDetails!.toJson();
    }
    if (this.healthConditions != null) {
      data['health_conditions'] = this.healthConditions!.toJson();
    }
    if (this.timeRegulations != null) {
      data['time_regulations'] = this.timeRegulations!.toJson();
    }
    if (this.decleration != null) {
      data['decleration'] = this.decleration!.toJson();
    }
    return data;
  }
}

class PersonalDetail {
  String? title;
  String? surname;
  String? forename;
  String? dob;
  String? gender;
  String? address;
  String? townCity;
  String? postalCode;
  String? country;
  String? nationality;
  String? homeTel;
  String? dayTimeContact;
  String? email;
  String? nationalInsuranceNo;
  String? remainTakeupEmploymentInUk;

  PersonalDetail(
      {this.title,
        this.surname,
        this.forename,
        this.dob,
        this.gender,
        this.address,
        this.townCity,
        this.postalCode,
        this.country,
        this.nationality,
        this.homeTel,
        this.dayTimeContact,
        this.email,
        this.nationalInsuranceNo,
        this.remainTakeupEmploymentInUk});

  PersonalDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    surname = json['surname'];
    forename = json['forename'];
    dob = json['dob'];
    gender = json['gender'];
    address = json['address'];
    townCity = json['town_city'];
    postalCode = json['postal_code'];
    country = json['country'];
    nationality = json['nationality'];
    homeTel = json['home_tel'];
    dayTimeContact = json['day_time_contact'];
    email = json['email'];
    nationalInsuranceNo = json['national_insurance_no'];
    remainTakeupEmploymentInUk = json['remain_takeup_employment_in_uk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['surname'] = this.surname;
    data['forename'] = this.forename;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['town_city'] = this.townCity;
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['nationality'] = this.nationality;
    data['home_tel'] = this.homeTel;
    data['day_time_contact'] = this.dayTimeContact;
    data['email'] = this.email;
    data['national_insurance_no'] = this.nationalInsuranceNo;
    data['remain_takeup_employment_in_uk'] = this.remainTakeupEmploymentInUk;
    return data;
  }
}

class Convictions {
  String? disclosure;

  Convictions({this.disclosure});

  Convictions.fromJson(Map<String, dynamic> json) {
    disclosure = json['disclosure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disclosure'] = this.disclosure;
    return data;
  }
}

class Address {
  String? houseNumber;
  String? postalCode;
  String? address;

  Address({this.houseNumber, this.postalCode, this.address});

  Address.fromJson(Map<String, dynamic> json) {
    houseNumber = json['house_number'];
    postalCode = json['postal_code'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['house_number'] = this.houseNumber;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    return data;
  }
}

class NextOfKin {
  String? title;
  String? surname;
  String? forename;
  String? dob;
  String? postalCode;
  String? address;
  String? homeTel;
  String? dayTimeContact;
  String? email;
  String? relationToYou;

  NextOfKin(
      {this.title,
        this.surname,
        this.forename,
        this.dob,
        this.postalCode,
        this.address,
        this.homeTel,
        this.dayTimeContact,
        this.email,
        this.relationToYou});

  NextOfKin.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    surname = json['surname'];
    forename = json['forename'];
    dob = json['dob'];
    postalCode = json['postal_code'];
    address = json['address'];
    homeTel = json['home_tel'];
    dayTimeContact = json['day_time_contact'];
    email = json['email'];
    relationToYou = json['relation_to_you'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['surname'] = this.surname;
    data['forename'] = this.forename;
    data['dob'] = this.dob;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['home_tel'] = this.homeTel;
    data['day_time_contact'] = this.dayTimeContact;
    data['email'] = this.email;
    data['relation_to_you'] = this.relationToYou;
    return data;
  }
}

class NmcDetail {
  String? nmcPinNo;
  String? expiryDate;

  NmcDetail({this.nmcPinNo, this.expiryDate});

  NmcDetail.fromJson(Map<String, dynamic> json) {
    nmcPinNo = json['nmc_pin_no'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nmc_pin_no'] = this.nmcPinNo;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}

class DbsDetail {
  String? dbsCertificationNo;
  String? registerOnlineDbs;
  String? codeNo;
  String? permissionToCheckOnline;

  DbsDetail(
      {this.dbsCertificationNo,
        this.registerOnlineDbs,
        this.codeNo,
        this.permissionToCheckOnline});

  DbsDetail.fromJson(Map<String, dynamic> json) {
    dbsCertificationNo = json['dbs_certification_no'];
    registerOnlineDbs = json['register_online_dbs'];
    codeNo = json['code_no'];
    permissionToCheckOnline = json['permission_to_check_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dbs_certification_no'] = this.dbsCertificationNo;
    data['register_online_dbs'] = this.registerOnlineDbs;
    data['code_no'] = this.codeNo;
    data['permission_to_check_online'] = this.permissionToCheckOnline;
    return data;
  }
}

class Employment {
  String? type;
  String? dateStarted;
  String? nameOfEmployer;
  String? positionHeld;
  String? reasonForLeaving;
  String? salaryOnLeavingPost;
  String? noticePeriod;
  String? dutiesDescription;

  Employment(
      {this.type,
        this.dateStarted,
        this.nameOfEmployer,
        this.positionHeld,
        this.reasonForLeaving,
        this.salaryOnLeavingPost,
        this.noticePeriod,
        this.dutiesDescription});

  Employment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    dateStarted = json['date_started'];
    nameOfEmployer = json['name_of_employer'];
    positionHeld = json['position_held'];
    reasonForLeaving = json['reason_for_leaving'];
    salaryOnLeavingPost = json['salary_on_leaving_post'];
    noticePeriod = json['notice_period'];
    dutiesDescription = json['duties_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date_started'] = this.dateStarted;
    data['name_of_employer'] = this.nameOfEmployer;
    data['position_held'] = this.positionHeld;
    data['reason_for_leaving'] = this.reasonForLeaving;
    data['salary_on_leaving_post'] = this.salaryOnLeavingPost;
    data['notice_period'] = this.noticePeriod;
    data['duties_description'] = this.dutiesDescription;
    return data;
  }
}

class Covid19 {
  String? covid19Test;
  String? tuberculosisVaccine;
  String? careHomeBefore;
  String? demantiaCareBefore;
  String? drivingLicense;

  Covid19(
      {this.covid19Test,
        this.tuberculosisVaccine,
        this.careHomeBefore,
        this.demantiaCareBefore,
        this.drivingLicense});

  Covid19.fromJson(Map<String, dynamic> json) {
    covid19Test = json['covid19_test'];
    tuberculosisVaccine = json['tuberculosis_vaccine'];
    careHomeBefore = json['care_home_before'];
    demantiaCareBefore = json['demantia_care_before'];
    drivingLicense = json['driving_license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['covid19_test'] = this.covid19Test;
    data['tuberculosis_vaccine'] = this.tuberculosisVaccine;
    data['care_home_before'] = this.careHomeBefore;
    data['demantia_care_before'] = this.demantiaCareBefore;
    data['driving_license'] = this.drivingLicense;
    return data;
  }
}

class BankDetails {
  String? nameOfBank;
  String? accountName;
  String? accountNo;
  String? sortCode;

  BankDetails(
      {this.nameOfBank, this.accountName, this.accountNo, this.sortCode});

  BankDetails.fromJson(Map<String, dynamic> json) {
    nameOfBank = json['name_of_bank'];
    accountName = json['account_name'];
    accountNo = json['account_no'];
    sortCode = json['sort_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_of_bank'] = this.nameOfBank;
    data['account_name'] = this.accountName;
    data['account_no'] = this.accountNo;
    data['sort_code'] = this.sortCode;
    return data;
  }
}

class HealthConditions {
  String? diabetes;
  String? circulatoryDisorder;
  String? stomachDisorder;
  String? deseaseDifficultyInSleep;
  String? chronicChestDisorder;
  String? anyOtherConditionThatMedicationStrictTimetable;
  String? haveYouCovid19Symptoms;

  HealthConditions(
      {this.diabetes,
        this.circulatoryDisorder,
        this.stomachDisorder,
        this.deseaseDifficultyInSleep,
        this.chronicChestDisorder,
        this.anyOtherConditionThatMedicationStrictTimetable,
        this.haveYouCovid19Symptoms});

  HealthConditions.fromJson(Map<String, dynamic> json) {
    diabetes = json['diabetes'];
    circulatoryDisorder = json['circulatory_disorder'];
    stomachDisorder = json['stomach_disorder'];
    deseaseDifficultyInSleep = json['desease_difficulty_in_sleep'];
    chronicChestDisorder = json['chronic_chest_disorder'];
    anyOtherConditionThatMedicationStrictTimetable =
    json['any_other_condition_that_medication_strict_timetable'];
    haveYouCovid19Symptoms = json['have_you_covid19_symptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diabetes'] = this.diabetes;
    data['circulatory_disorder'] = this.circulatoryDisorder;
    data['stomach_disorder'] = this.stomachDisorder;
    data['desease_difficulty_in_sleep'] = this.deseaseDifficultyInSleep;
    data['chronic_chest_disorder'] = this.chronicChestDisorder;
    data['any_other_condition_that_medication_strict_timetable'] =
        this.anyOtherConditionThatMedicationStrictTimetable;
    data['have_you_covid19_symptoms'] = this.haveYouCovid19Symptoms;
    return data;
  }
}

class TimeRegulations {
  int? otpOut;
  int? doNotOtpOut;

  TimeRegulations({this.otpOut, this.doNotOtpOut});

  TimeRegulations.fromJson(Map<String, dynamic> json) {
    otpOut = json['otp_out'];
    doNotOtpOut = json['do_not_otp_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp_out'] = this.otpOut;
    data['do_not_otp_out'] = this.doNotOtpOut;
    return data;
  }
}

class Decleration {
  String? signature;
  String? date;

  Decleration({this.signature, this.date});

  Decleration.fromJson(Map<String, dynamic> json) {
    signature = json['signature'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signature'] = this.signature;
    data['date'] = this.date;
    return data;
  }
}
