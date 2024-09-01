//
//  FirestoreService.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import FirebaseFirestore

/// Firestore service protocol
protocol IFirestoreService {
  /// Method for creating data in Firestore
  func createItem<T: Codable & Identifiable>(item: T) async -> Bool where T.ID == String?

  /// Method for fetching data from Firestore
  func fetchItem<T: Codable>(docId: String) async -> T?

  /// Method for fetching all data from Firestore
  func fetchAllItems<T: Codable>() async -> [T]?

  /// Method for deleting data from Firestore
  func deleteItem(docId: String) async -> Bool

  /// Method for editing data in Firestore
  func editItem<T: Codable & Identifiable>(item: T) async -> Bool where T.ID == String?

  /// Firestore collection for service
  var collection: FirestoreCollections { get }
}

extension IFirestoreService {
  /// Firestore collection reference
  var db: CollectionReference {
    Firestore.firestore().collection(collection.rawValue)
  }

  /// Method for checking if document id is empty
  fileprivate func checkDocIdEmpty(_ docId: String) -> Bool {
    if docId.isEmpty {
      print("Document id is empty")
      return true
    } else {
      return false
    }
  }
}

/// Example firestore service class
final class FirestoreService: IFirestoreService {
  init(_ collection: FirestoreCollections) {
    self.collection = collection
  }

  var collection: FirestoreCollections

  func editItem<T: Codable & Identifiable>(item: T) async -> Bool where T.ID == String? {
    guard !checkDocIdEmpty(item.id ?? "") else { return false }

    do {
      let encodedItem = try Firestore.Encoder().encode(item)
      try await db.document(item.id!).setData(encodedItem)
      return true
    } catch {
      print("\(T.self) edit error: \(error.localizedDescription)")
      return false
    }
  }

  func deleteItem(docId: String) async -> Bool {
    guard !checkDocIdEmpty(docId) else { return false }

    do {
      try await db.document(docId).delete()
      return true
    } catch {
      print("Delete error: \(error.localizedDescription)")
      return false
    }
  }

  func createItem<T: Codable & Identifiable>(item: T) async -> Bool where T.ID == String? {
    guard !checkDocIdEmpty(item.id ?? "") else { return false }

    do {
      let encodedItem = try Firestore.Encoder().encode(item)
      try await db.document(item.id!).setData(encodedItem)
      return true
    } catch {
      print("\(T.self) create error: \(error.localizedDescription)")
      return false
    }
  }

  func fetchItem<T: Codable>(docId: String) async -> T? {
    guard !checkDocIdEmpty(docId) else { return nil }

    do {
      let responseData = try await db.document(docId).getDocument().data()
      let data = try Firestore.Decoder().decode(T.self, from: responseData ?? [:])
      return data

    } catch {
      print("\(T.self) fetch error: \(error.localizedDescription)")
      return nil
    }
  }

  func fetchAllItems<T: Codable>() async -> [T]? {
    do {
      let responseDocuments = try await db.getDocuments().documents
      guard !responseDocuments.isEmpty else {
        print("\(T.self) No data found")
        return nil
      }
      var items: [T] = []
      for document in responseDocuments {
        let data = try Firestore.Decoder().decode(T.self, from: document.data())
        items.append(data)
      }

      return items

    } catch {
      print("\(T.self) fetch error: \(error.localizedDescription)")
      return nil
    }
  }
}
