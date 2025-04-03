//
//  Image.swift
//  Layer
//
//  Created by Tsumugi on 2025/04/03.
//

import Foundation

struct Images{
    let id:String
    let imageName: String
    var imageUrl: String?
}

extension Images{
    
    static let MOCK_IMAGE1 = Images(id: "1", imageName: "テスト1", imageUrl:"user01")
    static let MOCK_IMAGE2 = Images(id: "2", imageName: "テスト2", imageUrl:"user02")
    static let MOCK_IMAGE3 = Images(id: "3", imageName: "テスト3", imageUrl:"user03")
    static let MOCK_IMAGE4 = Images(id: "4", imageName: "テスト4", imageUrl:"user04")
    static let MOCK_IMAGE5 = Images(id: "5", imageName: "テスト5", imageUrl:"user05")
    static let MOCK_IMAGE6 = Images(id: "6", imageName: "テスト6", imageUrl:"user06")
    static let MOCK_IMAGE7 = Images(id: "7", imageName: "テスト7")

}
