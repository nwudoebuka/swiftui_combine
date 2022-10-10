//
//  Container.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//

import Foundation
import Foundation

class Container {
    static let jsonDecoder: JSONDecoder = JSONDecoder()
    
    static var weatherJSONDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
}
