//
//  LoginViewModel.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 09/02/2021.
//

import SwiftUI
import Firebase

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var isLoading = false
    @Published var alertMessage = ""
    @Published var showAlert = false
    @Published var isSuccessful = false
    @Published var isSignUp = false
    
    func login() {
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            self.isLoading = false
            
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                self.isSuccessful = true
                print("successful login babyyyyyyyyyyyy")
            }
        }
    }
    
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        
        do {
          try firebaseAuth.signOut()
            print("signed out")
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    
    func createUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                self.isSuccessful = true
                print("successful sign up babyyyyyyyyyyyy")
            }
        }
    }
    
    
}
