//
//  UsersCard.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 06/10/2022.
//
import SwiftUI

struct UsersCard: View {
    var nameAndUserName = ""
    var email = ""
    var address = ""
    var body: some View {
      HStack{
          VStack(alignment: .leading, spacing: 0){
             
            Text(nameAndUserName)
            .multilineTextAlignment(.leading)
            .font(.system(size: 14, weight: .bold, design: .default))
            Text(email)
            .multilineTextAlignment(.leading)
            .font(.system(size: 12, weight: .light, design: .default))
            Text(address)
            .multilineTextAlignment(.leading)
            .font(.system(size: 12, weight: .light, design: .default))
          }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .navigationBarHidden(true)
      }
    }
}

struct UsersCard_Previews: PreviewProvider {
    static var previews: some View {
      UsersCard()
    }
}
