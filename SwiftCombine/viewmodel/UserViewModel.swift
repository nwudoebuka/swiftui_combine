//
//  UserViewModel.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//

import Foundation
import SwiftUI
import Combine

final class UserViewModel: ObservableObject {
    private let apiService: ServiceProtocol = Service()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private (set) var users = [ResultResponse]()
    @Published private (set) var errorMessage: String?
    @Published var filterdUsers = [ResultResponse]()
  
    func getUser() {
      apiService.getUsers()
      .decode(type: UserResponse.self, decoder: Container.weatherJSONDecoder)
      .receive(on: RunLoop.main)
      .sink(
          receiveCompletion: { [weak self] completion in
              //self?.users = nil
            switch completion {
            case .failure(let error):do {
              debugPrint("failed viewmodel with error \(error)")
            }
            case .finished: print("Publisher is finished")
               }
          },
          receiveValue: { [weak self] users in
            self?.users += users.results
            self?.filterdUsers = self!.users
            debugPrint("viewmodel response is \(self?.users)")
          }
          
      )
      .store(in: &bag)
      }
         

}

