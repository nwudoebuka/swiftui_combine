//
//  ContentView.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    var initialText: String = ""
    @State var emailKey = ""
    @State var passwordKey = ""
    @State var isEmailValidEntry : Bool   = false
    @State var isPasswordValidEntry : Bool   = false
    @State private var canNavigateToDashboard = false
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
      let emailBinding = Binding<String>(get: {
                 self.emailKey
             }, set: {
                 self.emailKey = $0
               if self.validateEmail(self.emailKey) {
                   self.isEmailValidEntry = true
               } else {
                   self.isEmailValidEntry = false
               }
             })
      
      let passwordBinding = Binding<String>(get: {
                 self.passwordKey
             }, set: {
                self.passwordKey = $0
               if self.validatePassword(self.passwordKey) {
                   self.isPasswordValidEntry = true
               } else {
                   self.isPasswordValidEntry = false
               }
             })
        NavigationView {
          VStack(alignment: .center, spacing: 0){
              Text("Login")
              .multilineTextAlignment(.center)
              .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
              .frame(minHeight: 50, maxHeight: 50)
            VStack(alignment: .leading, spacing: 0) {
            CustomTextField(initialText: initialText,isPassword: false,binding:emailBinding,isValidEntry: isEmailValidEntry)
            if !self.validateEmail(self.emailKey) && !self.emailKey.isEmpty {
              Spacer()
                .frame(minHeight: 4, maxHeight: 4)
            Text("Invalid email format")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading,20)
              .foregroundColor(.red)
              .font(.system(size: 14))
              .multilineTextAlignment(.leading)
            }
          }
            Spacer()
              .frame(minHeight: 20, maxHeight: 20)
            CustomTextField(initialText: initialText,isPassword: true,binding:passwordBinding,isValidEntry: isPasswordValidEntry)
            Spacer()
              .frame(minHeight: 40, maxHeight: 40)
            Button(action: {
              if isEmailValidEntry && isPasswordValidEntry{
              canNavigateToDashboard = true
              }
            }, label: {
              Text("Login")
                .frame(width: UIScreen.screenWidth - 40, height: 45, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold, design: .default))
            }).frame(width: UIScreen.screenWidth - 40, height: 45)
              .background(Color.black)
          }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        }
        .fullScreenCover(isPresented: $canNavigateToDashboard, content:  DashboardView.init)
    }
  
  func validateEmail(_ string: String) -> Bool {
      if string.count > 100 {
          return false
      }
      let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
      //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
      return emailPredicate.evaluate(with: string)
  }
  
  func validatePassword(_ string: String) -> Bool {
      if string.count < 6 {
          return false
      }
      return true
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
