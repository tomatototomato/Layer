//
//  AuthViewModel.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        
        self.userSession = Auth.auth().currentUser
        print("\(self.userSession?.email)")
        
        //Test for logout
        logout()
    }
    
    //login
    @MainActor
    func login(email: String, password: String) async {
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功:\(result.user.email)")
            self.userSession = result.user
            print("self.userSession:\(self.userSession?.email)")
        } catch {
            print("ログイン失敗:\(error.localizedDescription)")
        }

    }
    
    //logout
    func logout(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("ログアウト失敗:\(error.localizedDescription)")
        }

    }
    
    //Create Account
    func createAccount(email: String, password: String) async {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("ユーザー登録成功:\(result.user.email)")
            self.userSession = result.user
            
        } catch {
            print("ユーザー登録失敗:\(error.localizedDescription)")
        }
        
        print("アカウント登録画面からCreateAccountメソッドが呼び出されました")
    }
    
    
    //Delete Account
    
    
    //Upload User Data
}
