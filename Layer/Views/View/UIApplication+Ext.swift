//
//  UIApplication+Ext.swift
//  SwiftUI-CaptureView
//
//  Created by Tsumugi on 2025/04/03.
//

import UIKit

extension UIApplication {
    
    static func image() -> UIImage? {
        guard let keyWindow = shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first else {
                return nil
        }
        
        guard let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        
        guard let view = rootViewController.view else {
            return nil
        }
        
        return view.image()
    }
    
}
