//
//  LoginViewModel.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 09/02/2021.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    let email:          String?
    let name:           String?
    let lastName:       String?
    let height:         Double?
}

final class UserSession: ObservableObject {
    
    @AppStorage("user") private var localUser: Data?
    
    @Published var email            = ""
    @Published var password         = ""
    @Published var name             = ""
    
    @Published var alertMessage     = ""
    @Published var showAlert        = false
    @Published var isSuccessful     = false
    @Published var isSignUp         = false
    @Published var isLoading        = false
    
    @Published var user: User?
    
    let firebaseAuth = Auth.auth()
    let db = Firestore.firestore()
    
    var ref: DocumentReference?
    
    init() {
        retrieveUserDetails()
    }
    
    func createUser(user: User) {
        firebaseAuth.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                withAnimation { self.isSuccessful = true }
            }
            
            do { let _ = try self.db.collection("Users").addDocument(from: user) }
            catch { print("failed to create user") }
        }
    }
    
    
    func login() {
        self.isLoading = true
        
        firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            self.isLoading = false
            
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                self.isSuccessful = true
                print("successful login babyyyyyyyyyyyy")
            }
            
            switch result { // this just prints the result not the user
            case .none:
                print("no user was found")
                
            case .some(_):
                self.getUser(with: self.email)
            }
        }
    }
    
    
    func saveChanges() {
        do {
            let data = try JSONEncoder().encode(email)
            localUser = data
        } catch {
           print("couldnt save")
        }
    }
    
    
    func retrieveUserDetails() {
        guard let localUser = localUser else { return }
        
        do { getUser(with: try JSONDecoder().decode(String.self, from: localUser)) }
        catch { print("couldnt retrieve") }
    }
    
    
    func getUser(with email: String) {
        if let user = firebaseAuth.currentUser {
            self.email = user.email ?? "something else"
            saveChanges()
            
            db.collection("Users").document(email).addSnapshotListener { querySnapshot, error in
                
                do { self.user = try querySnapshot?.data(as: User.self) }
                catch { print("error finding documents") }
            }
        }
    }

    
    func signOut() {
        do {
          try firebaseAuth.signOut()
            print("signed out")
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    func something() {

    struct obj {
        var id: String
        var name: String
    }

    var objects: [obj] = [obj(id: "1", name: "kalin"),
                          obj(id: "1", name: "Jakub"),
                          obj(id: "2", name: "jaidan")
    ]

    var ob = objects

    for i in 0..<objects.count {
        ob.removeAll(where: { $0.id == objects[i+1].id })
    }

    print(objects)
    }
    
    
}
