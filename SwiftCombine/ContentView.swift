//
//  ContentView.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 05/10/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var initialText: String = ""
    @State var emailKey = ""
    @State var passwordKey = ""
    @State var isEmailValidEntry : Bool   = true
    @State var isPasswordValidEntry : Bool   = true
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
            CustomTextField(initialText: initialText,isPassword: false,binding:emailBinding,isValidEntry: isEmailValidEntry)
            Spacer()
              .frame(minHeight: 20, maxHeight: 20)
            CustomTextField(initialText: initialText,isPassword: true,binding:passwordBinding,isValidEntry: isPasswordValidEntry)
            Spacer()
              .frame(minHeight: 40, maxHeight: 40)
            Button(action: {
            }, label: {
              Text("Login")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold, design: .default))
            }).frame(width: UIScreen.screenWidth - 40, height: 45)
              .background(Color.black)
          }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
          
        }
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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
