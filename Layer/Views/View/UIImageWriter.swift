//
//  UIImageWriter.swift
//  SwiftUI-CaptureView
//
//  Created by Tsumugi on 2025/04/03.
//

import UIKit

class UIImageWriter: NSObject {
    private var completion: (_ error: Error?) -> Void = { _ in }
    
    func writeToSavedPhotosAlbum(image: UIImage, completion: @escaping (_ error: Error?) -> Void) {
        self.completion = completion
        
        UIImageWriteToSavedPhotosAlbum(image,
                                       self,
                                       #selector(image(_:didFinishSavingWithError:contextInfo:)),
                                       nil)
    }
    
    @objc
    private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
}
