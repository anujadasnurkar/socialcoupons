import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  Future<void> addNgoData(Map ngoData, String ngoID) async{
    await FirebaseFirestore.instance.collection("ngo")
        .doc(ngoID).set(ngoData)
        .catchError((e){
      print(e.toString());
    });
  }
}

class DatabaseServiceEvent{
  Future<void> addNgoData(Map eventData, String eventID) async{
    await FirebaseFirestore.instance.collection("events")
        .doc(eventID).set(eventData)
        .catchError((e){
      print(e.toString());
    });
  }
}

class DatabaseServiceVolunteer{
  Future<void> addNgoData(Map volunteerData, String volunteerID) async{
    await FirebaseFirestore.instance.collection("volunteer")
        .doc(volunteerID).set(volunteerData)
        .catchError((e){
      print(e.toString());
    });
  }
}


class NgoData{
  getNgoData() async {
    return FirebaseFirestore.instance.collection("ngo").snapshots();
  }
}


class EventData{
  getEventData() async {
    return FirebaseFirestore.instance.collection("events").snapshots();
  }
}