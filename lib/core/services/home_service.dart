import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryReference =
      FirebaseFirestore.instance.collection("Categories");
  final CollectionReference _productsReference =
      FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryReference.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _productsReference.get();
    return value.docs;
  }
}
