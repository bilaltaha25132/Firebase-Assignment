import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment/models/entry_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'entries';

  Future<void> saveEntry(Entry entry) async {
    try {
      if (entry.id.isEmpty) {
        // If entry ID is empty, it's a new entry, so add it to Firestore
        await _firestore.collection(_collectionName).add(entry.toMap());
      } else {
        // If entry ID is not empty, update the existing entry in Firestore
        await _firestore.collection(_collectionName).doc(entry.id).update(entry.toMap());
      }
    } catch (e) {
      print("Error saving entry: $e");
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }

  Future<void> deleteEntry(String entryId) async {
    try {
      await _firestore.collection(_collectionName).doc(entryId).delete();
    } catch (e) {
      print("Error deleting entry: $e");
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }
}