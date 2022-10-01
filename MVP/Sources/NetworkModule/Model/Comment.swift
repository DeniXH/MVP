//
//  Comment.swift
//  MVP
//
//  Created by Денис Холодков on 01.10.2022.
//

import Foundation

// в этой модели берется структура из JSon
struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
