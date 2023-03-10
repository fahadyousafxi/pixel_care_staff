class ApplicationFormModel {
  dynamic postAppliedFor;
  dynamic howHeardVacancy;
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
        ? PersonalDetail.fromJson(json['personal_detail'])
        : null;
    convictions = json['convictions'] != null
        ? Convictions.fromJson(json['convictions'])
        : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    nextOfKin = json['next_of_kin'] != null
        ? NextOfKin.fromJson(json['next_of_kin'])
        : null;
    nmcDetail = json['nmc_detail'] != null
        ? NmcDetail.fromJson(json['nmc_detail'])
        : null;
    dbsDetail = json['dbs_detail'] != null
        ? DbsDetail.fromJson(json['dbs_detail'])
        : null;
    if (json['employment'] != null) {
      employment = <Employment>[];
      json['employment'].forEach((v) {
        employment!.add(Employment.fromJson(v));
      });
    }
    covid19 =
        json['covid_19'] != null ? Covid19.fromJson(json['covid_19']) : null;
    bankDetails = json['bank_details'] != null
        ? BankDetails.fromJson(json['bank_details'])
        : null;
    healthConditions = json['health_conditions'] != null
        ? HealthConditions.fromJson(json['health_conditions'])
        : null;
    timeRegulations = json['time_regulations'] != null
        ? TimeRegulations.fromJson(json['time_regulations'])
        : null;
    decleration = json['decleration'] != null
        ? Decleration.fromJson(json['decleration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_applied_for'] = postAppliedFor;
    data['how_heard_vacancy'] = howHeardVacancy;
    if (personalDetail != null) {
      data['personal_detail'] = personalDetail!.toJson();
    }
    if (convictions != null) {
      data['convictions'] = convictions!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (nextOfKin != null) {
      data['next_of_kin'] = nextOfKin!.toJson();
    }
    if (nmcDetail != null) {
      data['nmc_detail'] = nmcDetail!.toJson();
    }
    if (dbsDetail != null) {
      data['dbs_detail'] = dbsDetail!.toJson();
    }
    if (employment != null) {
      data['employment'] = employment!.map((v) => v.toJson()).toList();
    }
    if (covid19 != null) {
      data['covid_19'] = covid19!.toJson();
    }
    if (bankDetails != null) {
      data['bank_details'] = bankDetails!.toJson();
    }
    if (healthConditions != null) {
      data['health_conditions'] = healthConditions!.toJson();
    }
    if (timeRegulations != null) {
      data['time_regulations'] = timeRegulations!.toJson();
    }
    if (decleration != null) {
      data['decleration'] = decleration!.toJson();
    }
    return data;
  }
}

class PersonalDetail {
  dynamic title;
  dynamic surname;
  dynamic forename;
  dynamic dob;
  dynamic gender;
  dynamic address;
  dynamic townCity;
  dynamic postalCode;
  dynamic country;
  dynamic nationality;
  dynamic homeTel;
  dynamic dayTimeContact;
  dynamic email;
  dynamic nationalInsuranceNo;
  dynamic remainTakeupEmploymentInUk;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['surname'] = surname;
    data['forename'] = forename;
    data['dob'] = dob;
    data['gender'] = gender;
    data['address'] = address;
    data['town_city'] = townCity;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['nationality'] = nationality;
    data['home_tel'] = homeTel;
    data['day_time_contact'] = dayTimeContact;
    data['email'] = email;
    data['national_insurance_no'] = nationalInsuranceNo;
    data['remain_takeup_employment_in_uk'] = remainTakeupEmploymentInUk;
    return data;
  }
}

class Convictions {
  dynamic disclosure;

  Convictions({this.disclosure});

  Convictions.fromJson(Map<String, dynamic> json) {
    disclosure = json['disclosure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disclosure'] = disclosure;
    return data;
  }
}

class Address {
  dynamic houseNumber;
  dynamic postalCode;
  dynamic address;

  Address({this.houseNumber, this.postalCode, this.address});

  Address.fromJson(Map<String, dynamic> json) {
    houseNumber = json['house_number'];
    postalCode = json['postal_code'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['house_number'] = houseNumber;
    data['postal_code'] = postalCode;
    data['address'] = address;
    return data;
  }
}

class NextOfKin {
  dynamic title;
  dynamic surname;
  dynamic forename;
  dynamic dob;
  dynamic postalCode;
  dynamic address;
  dynamic homeTel;
  dynamic dayTimeContact;
  dynamic email;
  dynamic relationToYou;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['surname'] = surname;
    data['forename'] = forename;
    data['dob'] = dob;
    data['postal_code'] = postalCode;
    data['address'] = address;
    data['home_tel'] = homeTel;
    data['day_time_contact'] = dayTimeContact;
    data['email'] = email;
    data['relation_to_you'] = relationToYou;
    return data;
  }
}

class NmcDetail {
  dynamic nmcPinNo;
  dynamic expiryDate;

  NmcDetail({this.nmcPinNo, this.expiryDate});

  NmcDetail.fromJson(Map<String, dynamic> json) {
    nmcPinNo = json['nmc_pin_no'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nmc_pin_no'] = nmcPinNo;
    data['expiry_date'] = expiryDate;
    return data;
  }
}

class DbsDetail {
  dynamic dbsCertificationNo;
  dynamic registerOnlineDbs;
  dynamic codeNo;
  dynamic permissionToCheckOnline;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dbs_certification_no'] = dbsCertificationNo;
    data['register_online_dbs'] = registerOnlineDbs;
    data['code_no'] = codeNo;
    data['permission_to_check_online'] = permissionToCheckOnline;
    return data;
  }
}

class Employment {
  dynamic type;
  dynamic dateStarted;
  dynamic nameOfEmployer;
  dynamic positionHeld;
  dynamic reasonForLeaving;
  dynamic salaryOnLeavingPost;
  dynamic noticePeriod;
  dynamic dutiesDescription;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['date_started'] = dateStarted;
    data['name_of_employer'] = nameOfEmployer;
    data['position_held'] = positionHeld;
    data['reason_for_leaving'] = reasonForLeaving;
    data['salary_on_leaving_post'] = salaryOnLeavingPost;
    data['notice_period'] = noticePeriod;
    data['duties_description'] = dutiesDescription;
    return data;
  }
}

class Covid19 {
  dynamic covid19Test;
  dynamic tuberculosisVaccine;
  dynamic careHomeBefore;
  dynamic demantiaCareBefore;
  dynamic drivingLicense;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['covid19_test'] = covid19Test;
    data['tuberculosis_vaccine'] = tuberculosisVaccine;
    data['care_home_before'] = careHomeBefore;
    data['demantia_care_before'] = demantiaCareBefore;
    data['driving_license'] = drivingLicense;
    return data;
  }
}

class BankDetails {
  dynamic nameOfBank;
  dynamic accountName;
  dynamic accountNo;
  dynamic sortCode;

  BankDetails(
      {this.nameOfBank, this.accountName, this.accountNo, this.sortCode});

  BankDetails.fromJson(Map<String, dynamic> json) {
    nameOfBank = json['name_of_bank'];
    accountName = json['account_name'];
    accountNo = json['account_no'];
    sortCode = json['sort_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_of_bank'] = nameOfBank;
    data['account_name'] = accountName;
    data['account_no'] = accountNo;
    data['sort_code'] = sortCode;
    return data;
  }
}

class HealthConditions {
  dynamic diabetes;
  dynamic circulatoryDisorder;
  dynamic stomachDisorder;
  dynamic deseaseDifficultyInSleep;
  dynamic chronicChestDisorder;
  dynamic anyOtherConditionThatMedicationStrictTimetable;
  dynamic haveYouCovid19Symptoms;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diabetes'] = diabetes;
    data['circulatory_disorder'] = circulatoryDisorder;
    data['stomach_disorder'] = stomachDisorder;
    data['desease_difficulty_in_sleep'] = deseaseDifficultyInSleep;
    data['chronic_chest_disorder'] = chronicChestDisorder;
    data['any_other_condition_that_medication_strict_timetable'] =
        anyOtherConditionThatMedicationStrictTimetable;
    data['have_you_covid19_symptoms'] = haveYouCovid19Symptoms;
    return data;
  }
}

class TimeRegulations {
  dynamic otpOut;
  dynamic doNotOtpOut;

  TimeRegulations({this.otpOut, this.doNotOtpOut});

  TimeRegulations.fromJson(Map<String, dynamic> json) {
    otpOut = json['otp_out'];
    doNotOtpOut = json['do_not_otp_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp_out'] = otpOut;
    data['do_not_otp_out'] = doNotOtpOut;
    return data;
  }
}

class Decleration {
  dynamic signature;
  dynamic date;

  Decleration({this.signature, this.date});

  Decleration.fromJson(Map<String, dynamic> json) {
    signature = json['signature'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signature'] = signature;
    data['date'] = date;
    return data;
  }
}
