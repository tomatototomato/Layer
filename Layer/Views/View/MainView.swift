//
//  MainView.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import PencilKit
import SwiftUI
import PDFKit
import PhotosUI

struct MainView: View {
    @State private var canvasView = PKCanvasView()
    @State private var isPresented: Bool = false
    @State private var showingAlert = false
    
    var body: some View {
        
        HStack{
            //ドキュメントエリア
            PDFKitView(urlString: "")
                .frame(width: canvasSize_width(),height: canvasSize_height())
            //描画エリア
            VStack{
                //画像選択ボタン----------
                Button(action: {
                    //action
                    isPresented = true
                }) {
                    Image(systemName: "photo.artframe")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundStyle(.blue)
                }
                .sheet(isPresented: $isPresented) {
                    //モーダル画面遷移
                    SelectImageView()
                }
                //描画エリア----------
                CanvasView(canvasView: $canvasView)
                    .edgesIgnoringSafeArea(.all)
                    .border(Color.black, width: 5)
                    .padding()
                //スクリーンショットボタン------------
                Button(action: {
                    //acrtion
                    self.showingAlert = true
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.system(size: 26,weight: .bold))
                        .foregroundStyle(.green)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(""),
                          message: Text("Do you save the screen?"),
                          primaryButton: .default(Text("OK")) {
                        guard let image = UIApplication.image() else {
                            print("error")
                            return
                        }
                        let imageWriter = UIImageWriter()
                        imageWriter.writeToSavedPhotosAlbum(image: image, completion: {error in
                            if error != nil {
                                print("error[\(error!)]")
                            }
                        })

                    }, secondaryButton: .cancel(Text("Cancel")) {
                    })
                }
            }
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


//    func takeScreenShot() {
//        
//        //コンテキスト開始
//        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
//        //viewを書き出す
//        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
//        // imageにコンテキストの内容を書き出す
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        //コンテキストを閉じる
//        UIGraphicsEndImageContext()
//        // imageをカメラロールに保存
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//    }
    
    
    #Preview {
        MainView()
    }


