//
//  Item.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 26/07/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import Foundation

struct Item {
    let by: String
    let id: Int
    let kids: [Int]
    let score: Int
    let time: Date
    let title: String?
    let text: String?
    let url: String?
    var htmlUrl: String {
        "https://news.ycombinator.com/item?id=\(id)"
    }
}

extension Item: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        by = try container.decode(String.self, forKey: .by)
        id = try container.decode(Int.self, forKey: .id)
        kids = try container.decodeIfPresent([Int].self, forKey: .kids) ?? []
        score = try container.decode(Int.self, forKey: .score)
        time = Date(timeIntervalSince1970: TimeInterval(try container.decode(Int.self, forKey: .time)))
        title = try container.decodeIfPresent(String.self, forKey: .title)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
