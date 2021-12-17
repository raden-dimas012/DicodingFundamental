//
//  Game.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

struct Game: Identifiable,Codable {
    let id: Int
    let name: String
    let release: String
    let image: String
    let rating: Double
    enum CodingKeys: String,CodingKey {
        case id
        case name
        case release = "released"
        case image = "background_image"
        case rating
    }
}
