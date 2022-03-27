//
//  LoginView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI

struct LoginView: View {

    @State var isSignUpMode : Bool = false
    @EnvironmentObject var vm : AuthViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            Text("Wecome")
                                .font(.title.bold())
                            Text("Start your journey now!")
                                .font(.title.bold())
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading){
                            Text("Email")
                                .font(.headline)
                                .padding(.horizontal)
                            
                        TextField("E-mail", text: $vm.email)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)
                                .autocapitalization(.none)
                        
                            Text("Password")
                                .font(.headline)
                                .padding(.horizontal)
                                .padding(.top, 30)
                            
                        TextField("Password", text: $vm.password)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)
                                .autocapitalization(.none)
                    }
                    .padding(.top, 30)
                    HStack {
                        Spacer()
                        Text("No account yet?")
                        Button(action: {
                            self.isSignUpMode.toggle()
                        }, label: {
                            Text("Sign Up")
                                .font(.headline.bold())
                        })
                        .fullScreenCover(isPresented: $isSignUpMode, onDismiss: nil) {
                            SignUpView()
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        vm.signInUser(email: vm.email, password: vm.password)
                    }, label: {
                        Text("Sign in ")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth : .infinity)
                            .frame(height : 55)
                            .background(.blue)
                            .cornerRadius(20)
                            .padding()
                    })
                    .fullScreenCover(isPresented: $vm.isLogin) {
                        MainView()
                    }
                } // vst
                .navigationTitle("Log In")
            }
        } // nav
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
