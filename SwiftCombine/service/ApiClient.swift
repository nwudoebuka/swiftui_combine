//
//  ApiClient.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//

import Foundation
import Combine

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class APIClient {
    static let shared = APIClient()

    func getRequestData(_ url: String,
                      method: RequestMethod,
                      headers: HTTPHeaders? = nil,
                      body: JSON? = nil) -> AnyPublisher<Data, Error> {
    
    let url = URL(string: url)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue

    if let headers = headers {
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    if let body = body {
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
    }

      return loadData(with: urlRequest)
          .eraseToAnyPublisher()
  }
  
  // MARK: - Getting data
  private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
      return URLSession.shared.dataTaskPublisher(for: request)
          .mapError({ error -> Error in
              APIErrors(rawValue: error.code.rawValue) ?? APIErrors.unknown
          })
          .map { $0.data }
          .eraseToAnyPublisher()
  }
    
    
}
