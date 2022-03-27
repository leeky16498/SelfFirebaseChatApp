//
//  AuthModel.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import Foundation
import Firebase
import UIKit
import SwiftUI

class AuthViewModel : ObservableObject{

    @Published var email : String = ""
    @Published var password : String = ""
    @Published var username : String = ""
    @Published var fullname : String = ""
    @Published var profileImage : UIImage?
    @Published var isLogin : Bool = false
    @Published var isSignUp : Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    func signInUser(email : String, password : String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Log in error")
                return
            }
            //success
            self.isLogin.toggle()
        }
    }
    
    func signUpUser(email : String, password : String, username : String, fullname : String) {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Create account error")
            }
            //success
            self.saveProfileImage()
        }
    }
    
    func saveProfileImage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        
        guard let imageData = self.profileImage?.jpegData(compressionQuality: 0.5) else {return}
        
        ref.putData(imageData, metadata: nil) { metaData, error in
            if let error = error {
                print("error to upload image to storage")
            }
            //success
            ref.downloadURL { url, error in
                if let error = error {
                    print("failed to retrieve download url")
                }
            //success to save image( 이미지의 다운로드 주소도 생성된 상태이다.
                //아래에서 부터는 url을 불러서 유저의 나머지 데이터를 저장해준다.
                guard let url = url else {return}
                self.storeUserInformation(imageProfileUrl: url)
            }
        }
    }
    
    func storeUserInformation(imageProfileUrl : URL) {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        let userData = ["email" : self.email, "uid" : uid, "profileImageUrl" : imageProfileUrl.absoluteString, "fullname" : self.fullname, "username" : self.username]
        
        FirebaseManager.shared.firestore.collection("users") // users라는 컬렉션을 생성하게 됩니다.
            .document(uid).setData(userData) { error in
                if let error = error {
                    print("error to save user data")
                }
                print("Success to sign up all")
                self.isSignUp.toggle()
            }
    }
    

}
