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
    
    var body: some View {
        
        HStack{
            PDFKitView(urlString: "")
                .frame(width: canvasSize_width(),height: canvasSize_height())
                .border(Color.black, width: 5)
            

            
            CanvasView(canvasView: $canvasView)
                .edgesIgnoringSafeArea(.all)
                .border(Color.black, width: 5)
                .padding()
        }
        
    }

}

//PDF
struct PDFKitView: UIViewRepresentable {
    private let url: URL

    init(urlString: String) {
        self.url = Bundle.main.url(forResource: urlString, withExtension: "pdf")!
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}


//AppDelegate
//class AppDelegate: NSObject, UIApplicationDelegate {
//    
//    // 回転可能か設定する。外部から変更できるよう静的としている
//    /*
//        ・回転許可：UIInterfaceOrientationMask.all
//        ・縦固定　：UIInterfaceOrientationMask.partrait
//        ・横固定　：UIInterfaceOrientationMask.landscape
//        ・その他　：https://developer.apple.com/documentation/uikit/uiinterfaceorientationmask/
//    */
//    static var orientationLock = UIInterfaceOrientationMask.landscape
    
//    // 設定の変更通知がされた時に呼ばれるデリゲート
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//        return AppDelegate.orientationLock
//    }
//}

//Viewサイズの取得
func canvasSize_width()->CGFloat{
    let ScreenWidth = GetScreenSize()
    let getWidth = CGFloat(ScreenWidth.ViewWidth()/2)
    return getWidth
}

func canvasSize_height()->CGFloat{
    let ScreenHeight = GetScreenSize()
    let getHeight = CGFloat(ScreenHeight.ViewHeight())
    return getHeight
}


#Preview {
    ContentView()
}
