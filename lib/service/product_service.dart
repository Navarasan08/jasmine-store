import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jasmine_app/models/product.dart';

class ProductService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static const String prodCollectionId = "product";
  static const String newArrivalCollectionId = "new_arraivals";


  // all products
  static Stream<QuerySnapshot> getProducts({bool isNewArrival = false}) async* {
  CollectionReference productCollection = isNewArrival
        ? firestore.collection(newArrivalCollectionId)
        : firestore.collection(prodCollectionId);

    try {
      yield* productCollection
          .where('isActive', isEqualTo: '1')
          // .orderBy('createdAt')
          .snapshots();
    } catch (e) {
      throw "$e";
    }
  }

  // single product : productId
  static Stream<DocumentSnapshot> getProduct(String docId, {bool isNewArrival = false}) async* {
  CollectionReference productCollection = isNewArrival
        ? firestore.collection(newArrivalCollectionId)
        : firestore.collection(prodCollectionId);
    try {
      yield* productCollection.doc(docId).snapshots();
    } catch (e) {
      throw "$e";
    }
  }

  static Future<void> addProduct(Product product,
      {bool isNewArrival = false}) async {
    CollectionReference productCollection = isNewArrival
        ? firestore.collection(newArrivalCollectionId)
        : firestore.collection(prodCollectionId);

    try {
      await productCollection.add(product.toJson());
      return;
    } catch (e) {
      throw "$e";
    }
  }

  static Future<void> updateProduct(String docId, Map<String, dynamic> product,
      {bool isNewArrival = false}) async {
    CollectionReference productCollection = isNewArrival
        ? firestore.collection(newArrivalCollectionId)
        : firestore.collection(prodCollectionId);

    try {
      await productCollection.doc(docId).set(product, SetOptions(merge: true));
      return;
    } catch (e) {
      throw "$e";
    }
  }

  static Future<void> deleteProduct(String productId,
      {bool isNewArrival = false}) async {
    CollectionReference productCollection = isNewArrival
        ? firestore.collection(newArrivalCollectionId)
        : firestore.collection(prodCollectionId);

    try {
      await productCollection.doc(productId).delete();
      return;
    } catch (e) {
      throw "$e";
    }
  }
}
