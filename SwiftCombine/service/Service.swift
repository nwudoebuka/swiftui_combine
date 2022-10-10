//
//  Service.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//

import Foundation
import Combine

protocol ServiceProtocol {
  func getUsers() -> AnyPublisher<Data, Error>
}

final class Service: ServiceProtocol{
  
  func getUsers() -> AnyPublisher<Data, Error> {
    return APIClient.shared.getRequestData("\(Constants.BASE_URL)/api", method: RequestMethod.get, headers: nil, body: nil)
        .eraseToAnyPublisher()
  }
  
  
}
