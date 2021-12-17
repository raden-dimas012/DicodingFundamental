//
//  GameDetail.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 03/11/21.
//

import Foundation

struct GameDetail: Identifiable,Codable {
    let id: Int
    let name: String?
    let release: String?
    let image: String?
    let rating: Double?
    let totalReview: Int?
    let description: String?
    let website: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case release = "released"
        case image = "background_image"
        case rating
        case totalReview = "reviews_count"
        case description = "description_raw"
        case website
    }
}
