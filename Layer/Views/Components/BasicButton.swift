//
//  BasicButton.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import SwiftUI

struct BasicButton: View {
    let label: String
    var icon: String? = nil
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label:{
            HStack{
                Text(label)
                if let name = icon{
                    Image(systemName: name)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .background(Color.black)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    BasicButton(label: "ボタン") {
        print("ボタンがタップされました")
    }
}
