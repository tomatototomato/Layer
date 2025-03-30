//
//  GetScreenSize.swift
//  Layer
//
//  Created by Tsumugi on 2025/03/30.
//
import UIKit

class GetScreenSize{
    
    var bounds = UIScreen.main.bounds
    
    //画面サイズを取得
    func ViewWidth()-> Int{
        let width = Int(bounds.width)
        return width
    }
    
    func ViewHeight()-> Int{
        let height = Int(bounds.height)
        return height
    }
    
}



