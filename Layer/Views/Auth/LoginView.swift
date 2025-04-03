//
//  LoginView.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import SwiftUI

struct LoginView: View {
    
    //private let authViewModel = AuthViewModel()
    let authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 24){
                //Image
                Image(systemName: "book")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120,height: 120)
                    .padding(.vertical, 32)
                //Form
                VStack{
                    InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                    
                }
                
                
                VStack{
                    InputField(text: $password, label: "パスワード", placeholder:"半角英数字6文字以上",isSecureField: true)
                    
                }
                
                //Button
                BasicButton(label: "ログイン", icon: "arrow.right") {
                    Task{
                        await authViewModel.login(email: email, password: password)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                //Navigation
                NavigationLink {
                    RegistrationView(authViewModel: authViewModel)
                        .navigationBarBackButtonHidden()
                }label: {
                    HStack{
                        Text("まだアカウントをお持ちでない方")
                        Text("会員登録")
                    }
                    .fontWeight(.bold)
                }
                .foregroundStyle(Color(.darkGray))
                
                
            }
        
            .padding(200)
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}
