//
//  DetailObjectModel.swift
//  numbersAppTest
//
//  Created by AppStarter on 24/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import Foundation

struct DetailObject {
    let number: String?
    let text: String?
    let imageURL: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case text
        case image
    }
}

extension DetailObject: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        number = try? values.decode(String.self, forKey: .name)
        text = try? values.decode(String.self, forKey: .text)
        imageURL = try? values.decode(URL.self, forKey: .image)
    }
}
