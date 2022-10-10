//
//  CustomTextField.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 05/10/2022.
//

import SwiftUI

struct CustomTextField: View {
  @State var initialText: String = ""
  var isPassword = false
  var binding: Binding<String>?
  var isValidEntry : Bool   = true
    var body: some View {
 
      if isPassword{
        ZStack(alignment: .leading){
          if binding!.wrappedValue.isEmpty {
            Text(binding!.wrappedValue.isEmpty ? " Password" : "")
                          .frame(maxWidth: .none,maxHeight: 45)
                          .font(.system(size: 12))
                           .foregroundColor(.black.opacity(0.4))
                           .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 20))
            
          }
          VStack{
        SecureField(initialText, text: binding!)
          .textFieldStyle(.plain)
          .font(.system(size: 14))
          .frame(maxWidth: .infinity,maxHeight: 45)
          .cornerRadius(8.0)
          .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
          .accentColor(Color.black)
          .cornerRadius(8.0)
          .textFieldStyle(.roundedBorder)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
          .overlay(RoundedRectangle(cornerRadius: 0).stroke((isValidEntry || binding!.wrappedValue.isEmpty) ? Color.clear : Color.red, lineWidth: 1)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
          }.frame(maxWidth: .infinity,maxHeight: 45)
          .background(Color.gray.opacity(0.3))
          .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
          .textFieldStyle(.roundedBorder)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
      }
      }else{
        ZStack(alignment: .leading){
          if binding!.wrappedValue.isEmpty {
            Text(binding!.wrappedValue.isEmpty ? " Email" : "")
                          .frame(maxWidth: .none,maxHeight: 45)
                          .font(.system(size: 12))
                           .foregroundColor(.black.opacity(0.4))
                           .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 20))
            
          }
          VStack{
        TextField(initialText, text: binding!)
                    .textFieldStyle(.plain)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity,maxHeight: 45)
                    .cornerRadius(8.0)
                    .textFieldStyle(.roundedBorder)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
          } .frame(maxWidth: .infinity,maxHeight: 45)
            .background(Color.gray.opacity(0.3))
            .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
            .textFieldStyle(.roundedBorder)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .overlay(RoundedRectangle(cornerRadius: 0).stroke((isValidEntry || binding!.wrappedValue.isEmpty) ? Color.clear : Color.red, lineWidth: 1).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)))
        }
      }
        
    }
  
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 15)
            }
            content
            .foregroundColor(Color.white)
            .padding(5.0)
        }
    }
}
