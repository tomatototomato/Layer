//
//  PDFViewRepresentable.swift
//  Layer
//
//  Created by Tsumugi on 2025/03/30.
//

import SwiftUI
import PDFKit
 
struct PDFViewRepresentable : UIViewRepresentable {
    typealias UIViewType = PDFView
     
    func makeUIView(context: Context) -> Self.UIViewType {
        let pdfView: PDFView = PDFView()
        if let url =  Bundle.main.url(forResource: "/Image/IPSJ-CG05119009.pdf", withExtension: "pdf") {
            pdfView.document = PDFDocument(url: url)
        }
        return pdfView
    }
     
    func updateUIView(_ uiView: Self.UIViewType, context: Context) {
    }
}
