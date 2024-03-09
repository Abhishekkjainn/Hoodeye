// ignore_for_file: public_member_api_docs, sort_constructors_first
class CrimeData {
  String state;
  String district;
  int year;
  int murder;
  int attemptToMurder;
  int homicide;
  int rape;
  int custodialRape;
  int otherRape;
  int kidnappingabduction;
  int kidnappingofWomen;
  int kidnappingofOthers;
  int dacoity;
  int preDacoity;
  int robbery;
  int burglary;
  int theft;
  int autoTheft;
  int otherTheft;
  int riots;
  int propertyDisputes;
  int cheating;
  int counterFieting;
  int fireToProperty;
  int hurt;
  int dowryDeath;
  int assaultToWomenModesty;
  int womenInsult;
  int Cruelty;
  int importFromForeign;
  int negligenceDeath;
  int otherIPCCrimes;
  int totalIPCCrimes;
  CrimeData({
    required this.state,
    required this.district,
    required this.year,
    required this.murder,
    required this.attemptToMurder,
    required this.homicide,
    required this.rape,
    required this.custodialRape,
    required this.otherRape,
    required this.kidnappingabduction,
    required this.kidnappingofWomen,
    required this.kidnappingofOthers,
    required this.dacoity,
    required this.preDacoity,
    required this.robbery,
    required this.burglary,
    required this.theft,
    required this.autoTheft,
    required this.otherTheft,
    required this.riots,
    required this.propertyDisputes,
    required this.cheating,
    required this.counterFieting,
    required this.fireToProperty,
    required this.hurt,
    required this.dowryDeath,
    required this.assaultToWomenModesty,
    required this.womenInsult,
    required this.Cruelty,
    required this.importFromForeign,
    required this.negligenceDeath,
    required this.otherIPCCrimes,
    required this.totalIPCCrimes,
  });

  factory CrimeData.fromMap(Map<String, dynamic> map) {
    return CrimeData(
        state: map['STATE/UT'],
        district: map['DISTRICT'],
        year: map['YEAR'],
        murder: map['MURDER'],
        attemptToMurder: map['ATTEMPTTOMURDER'],
        homicide: map['HOMICIDE'],
        rape: map['RAPE'],
        custodialRape: map['CUSTODIALRAPE'],
        otherRape: map['OTHERRAPE'],
        kidnappingabduction: map['KIDNAPPINGABDUCTION'],
        kidnappingofWomen: map['KIDNAPPINGOFWOMEN'],
        kidnappingofOthers: map['KIDNAPPINGOTHERS'],
        dacoity: map['DACOITY'],
        preDacoity: map['PREPARATION AND ASSEMBLY FOR DACOITY'],
        robbery: map['ROBBERY'],
        burglary: map['BURGLARY'],
        theft: map['THEFT'],
        autoTheft: map['AUTOTHEFT'],
        otherTheft: map['OTHERTHEFT'],
        riots: map['RIOTS'],
        propertyDisputes: map['PROPERTYDISPUTES'],
        cheating: map['CHEATING'],
        counterFieting: map['COUNTERFIETING'],
        fireToProperty: map['FIRETOPROPERTY'],
        hurt: map['HURT/GREVIOUS HURT'],
        dowryDeath: map['DOWRYDEATHS'],
        assaultToWomenModesty:
            map['ASSAULTONWOMENWITHINTENTTOOUTRAGEHERMODESTY'],
        womenInsult: map['WOMENINSULT'],
        Cruelty: map['CRUELTY'],
        importFromForeign: map['IMPORTGIRLSFROMFOREIGN'],
        negligenceDeath: map['NEGLIGENCEDEATH'],
        otherIPCCrimes: map['OTHERIPCCRIMES'],
        totalIPCCrimes: map['TOTALIPCCRIMES']);
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'district': district,
      'year': year,
      'murder': murder,
      'attemptToMurder': attemptToMurder,
      'homicide': homicide,
      'rape': rape,
      'custodialRape': custodialRape,
      'otherRape': otherRape,
      'kidnappingabduction': kidnappingabduction,
      'kidnappingofWomen': kidnappingofWomen,
      'kidnappingofOthers': kidnappingofOthers,
      'dacoity': dacoity,
      'preDacoity': preDacoity,
      'robbery': robbery,
      'burglary': burglary,
      'theft': theft,
      'autoTheft': autoTheft,
      'otherTheft': otherTheft,
      'riots': riots,
      'propertyDisputes': propertyDisputes,
      'cheating': cheating,
      'counterFieting': counterFieting,
      'fireToProperty': fireToProperty,
      'hurt': hurt,
      'dowryDeath': dowryDeath,
      'assaultToWomenModesty': assaultToWomenModesty,
      'womenInsult': womenInsult,
      'Cruelty': Cruelty,
      'importFromForeign': importFromForeign,
      'negligenceDeath': negligenceDeath,
      'otherIPCCrimes': otherIPCCrimes,
      'totalIPCCrimes': totalIPCCrimes
    };
  }
}

class ResourceModal {
  String distrctname;
  String PoliceStationName;
  String HospitalName;
  String EmergencyShelter;
  String GovtBuilding;
  ResourceModal({
    required this.distrctname,
    required this.PoliceStationName,
    required this.HospitalName,
    required this.EmergencyShelter,
    required this.GovtBuilding,
  });

  factory ResourceModal.fromMap(Map<String, dynamic> map) {
    return ResourceModal(
        distrctname: map['District Name'],
        PoliceStationName: map['Police Station'],
        HospitalName: map['Hospital'],
        EmergencyShelter: map['Emergency Shelter'],
        GovtBuilding: map['Government Building']);
  }
  Map<String, dynamic> toMap() {
    return {
      'distrctname': distrctname,
      'PoliceStationName': PoliceStationName,
      'HospitalName': HospitalName,
      'EmergencyShelter': EmergencyShelter,
      'GovtBuilding': GovtBuilding
    };
  }
}
