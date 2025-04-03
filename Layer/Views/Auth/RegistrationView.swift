//
//  RegistrationView.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import SwiftUI

struct RegistrationView: View {
    
    //private let authViewModel = AuthViewModel()
    let authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        VStack(spacing: 24){
            //Image
            Image(systemName: "note")
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
            
            VStack{
                InputField(text: $confirmPassword, label: "パスワード(確認用)", placeholder:"もう一度入力してください",isSecureField: true)
            }
            
            //Button
            BasicButton(label:"登録", icon: "arrow.right") {
                Task{
                    await authViewModel.createAccount(email: email, password: password)
                }

            }
            .padding(.top, 24)
            
            Spacer()
            
            //Navigation
            Button {
                dismiss()
            }label: {
                HStack{
                    Text("すでにアカウントをお持ちの方")
                    Text("ログイン")
                }
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color(.darkGray))
            
            
        }
        .padding(200)
    }
}

#Preview {
    RegistrationView(authViewModel: AuthViewModel())
}
