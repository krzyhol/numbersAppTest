//
//  MainObjectModel.swift
//  numbersAppTest
//
//  Created by AppStarter on 24/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import Foundation

struct MainObject {
    let number: String?
    let imageURL: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image
    }
}

extension MainObject: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        number = try? values.decode(String.self, forKey: .name)
        imageURL = try? values.decode(URL.self, forKey: .image)
    }
}
