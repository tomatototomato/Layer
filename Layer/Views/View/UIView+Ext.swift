//
//  UIView+Ext.swift
//  SwiftUI-CaptureView
//
//  Created by Tsumugi on 2025/04/03.
//

import UIKit

extension UIView {
    
    func image() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
