//
//  InputField.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text:String
    let label: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading, spacing: 12){
                Text(label)
                    .foregroundStyle(Color(.darkGray))
                    .fontWeight(.semibold)
                    .font(.footnote)
                if isSecureField{
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
                Divider()
            }
        }
    }
}

#Preview {
    InputField(text: .constant(""),label: "メールアドレス",placeholder: "入力してください")
}
