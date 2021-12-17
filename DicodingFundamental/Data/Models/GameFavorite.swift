//
//  GameFavorite.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 05/11/21.
//

import Foundation

struct GameFavorite: Identifiable,Codable {
    let id: Int32?
    let name: String?
    let release: String?
    let image: String?
    let rating: Double?
    let ratingTop: Int32?
    let description: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case release = "released"
        case image = "background_image"
        case rating
        case ratingTop = "rating_top"
        case description = "description_raw"
    }
}
