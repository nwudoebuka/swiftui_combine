//
//  CustomTextField.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 05/10/2022.
//

import SwiftUI

struct CustomTextField: View {
  var initialText: String = ""
  var isPassword = false
  var binding: Binding<String>?
  var isValidEntry : Bool   = true
    var body: some View {
 
      if isPassword{
        SecureField(initialText, text: binding!)
          .textFieldStyle(.plain)
          .font(.system(size: 14))
          .frame(maxWidth: .infinity,maxHeight: 45)
          .background(Color.gray.opacity(0.1))
          .cornerRadius(8.0)
          .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
          .accentColor(Color.black)
          .textFieldStyle(.roundedBorder)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
          .overlay(RoundedRectangle(cornerRadius: 1).stroke(isValidEntry ? Color.clear : Color.red, lineWidth: 1)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)))
      }else{
        TextField(initialText, text: binding!)
                    .textFieldStyle(.plain)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity,maxHeight: 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                    .textFieldStyle(.roundedBorder)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(isValidEntry ? Color.clear : Color.red, lineWidth: 1)
                              .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)))
      }
        
    }
  
}
