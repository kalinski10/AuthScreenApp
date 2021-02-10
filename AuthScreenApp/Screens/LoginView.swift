//
//  ContentView.swift
//  AuthScreenApp
//
//  Created by Kalin Balabanov on 09/02/2021.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            BrandGradient()

            VStack(alignment: .leading) {
                VStack (alignment: .leading){
                    Text("Welcome")
                        .foregroundColor(.secondary)
                    
                    Text(viewModel.isSignUp ? "Sign up" : "Sign in")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                }
                .padding(50)
                
                VStack(spacing: 30) {
                    if viewModel.isSignUp {
                        NameItem(name: $viewModel.name)
                    }
                    
                    EmailItem(email: $viewModel.email)
                    
                    PasswordItem(password: $viewModel.password)
                    
                    if !viewModel.isSignUp {
                        Button {
                            print("Forgot password")
                        } label: {
                            Text("Forget password?")
                                .foregroundColor(.secondary)
                                .fontWeight(.light)
                        }
                    }
                    
                    Button { viewModel.login() }
                        label: {
                            Text("Sign in")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 258, height: 50)
                                .background(BrandGradient())
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                        }
                    
                    OrItem()
                    
                    HStack(spacing: 50) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(viewModel.isSignUp ? "Already have an account?" : "Don't have an account?")
                            .foregroundColor(.secondary)
                        
                        Button {
                            withAnimation {
                                viewModel.isSignUp.toggle()
                            }
                        }
                            label: {
                                Text(viewModel.isSignUp ? "Sign in" : "Sign up")
                                    .bold()
                                    .foregroundColor(Color(.systemIndigo))
                            }
                    }
                    .padding()
                    
                }
                .padding(50)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .ignoresSafeArea()
            }
            
            if viewModel.isLoading {
                ZStack {
                    Color.white.opacity(0.6)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
                .ignoresSafeArea()
            }
        }
        .alert(isPresented: $viewModel.isSuccessful) {
            Alert(title: Text("successful login"), message: Text("Congratulations on a succesful login attempt"), dismissButton: .default(Text("ok")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct NameItem: View {
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
            
            TextField("Enter full name", text: $name)
            
            Divider()
        }
    }
}

struct EmailItem: View {
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
            
            TextField("Enter Email", text: $email)
            
            Divider()
        }
    }
}

struct PasswordItem: View {
    
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
            
            SecureField("Enter Password...", text: $password)
            
            Divider()
        }
    }
}

struct OrItem: View {
    var body: some View {
        HStack {
            VStack {
                Divider()
            }
            Text("OR")
                .foregroundColor(.secondary)
            VStack {
                Divider()
            }
        }
    }
}

struct BrandGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(.systemPurple), Color(.systemIndigo)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
