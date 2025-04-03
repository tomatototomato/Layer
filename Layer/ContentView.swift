//
//  ContentView.swift
//  Layer
//
//  Created by Tsumugi on 2025/03/30.
//

import PencilKit
import SwiftUI
import PDFKit

struct ContentView: View {
    
    @State private var canvasView = PKCanvasView()
    @ObservedObject var authViewModel = AuthViewModel()

    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                MainView()
            } else {
                LoginView(authViewModel: authViewModel)
            }
        }
    }
}


#Preview {
    ContentView()
}
