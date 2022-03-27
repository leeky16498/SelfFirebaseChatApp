//
//  SigninView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI

struct SignUpView: View {

    @State var showImagePicker : Bool = false
    @EnvironmentObject var vm : AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode

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
                    .padding(.top, 10)
                    
                    HStack {
                        Button(action: {
                            self.showImagePicker.toggle()
                        }, label: {
                            
                            if let profileImage = vm.profileImage {
                                Image(uiImage: profileImage)
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.black)
                                    .frame(width : 50, height : 50)
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .stroke(.gray, lineWidth: 1)
                                    )
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.black)
                                    .frame(width : 50, height : 50)
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .stroke(.gray, lineWidth: 1)
                                    )
                            }
                        })
                        .sheet(isPresented: $showImagePicker, content: {
                            ImagePicker(image: $vm.profileImage)
                        })
                        
                        VStack {
                            Spacer()
                            Text(vm.profileImage == nil ? "Select your profile photo" : "What a nice picture it is!")
                                .font(.headline)
                        }
                        .padding(.horizontal)
                        
                        
                        Spacer()
                    }
                    .padding()
                    
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
                            .padding(.top, 20)
                            
                        SecureField("Password", text: $vm.password)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                        
                        Text("Username")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 20)
                        
                        TextField("Username", text: $vm.username)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                        
                        Text("Fullname")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 20)
                        
                        TextField("Fullname", text: $vm.fullname)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                    }
                    .padding(.top, 20)
                    HStack {
                        Spacer()
                        Text("Already have account?")
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
                                .font(.headline.bold())
                        })
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        vm.signUpUser(email: vm.email, password: vm.password, username: vm.username, fullname: vm.fullname)
                    }, label: {
                        Text("Sign Up")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth : .infinity)
                            .frame(height : 55)
                            .background(.blue)
                            .cornerRadius(20)
                            .padding()
                    })
                } // vst
                .navigationTitle("Sign Up")
            }
        } // nav
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
