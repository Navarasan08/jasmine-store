import 'package:cloud_firestore/cloud_firestore.dart';

class LandingService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static const mainImageCollectionId = "main_images";

  // carosusal images
  static Stream<QuerySnapshot> getCarousalImages({bool isNewArrival = false}) async* {
    CollectionReference productCollection =
        firestore.collection(mainImageCollectionId);

    try {
      yield* productCollection
          .where('isActive', isEqualTo: '1')
          // .orderBy('createdAt')
          .snapshots();
    } catch (e) {
      throw "$e";
    }
  }
}
