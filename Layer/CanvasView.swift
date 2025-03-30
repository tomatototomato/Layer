//
//  CanvasView.swift
//  Layer
//
//  Created by Tsumugi on 2025/03/30.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    private let toolPicker = PKToolPicker()
    func makeUIView(context: Context) -> some UIView {
        canvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
        
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        
        canvasView.becomeFirstResponder()
        return canvasView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
