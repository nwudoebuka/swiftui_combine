//
//  DashboardView.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 06/10/2022.
//

import SwiftUI
import Combine

struct DashboardView: View {
  @State var searchKey = ""
  var initialText: String = ""
  init() {
     UITableView.appearance().separatorStyle = .none
     UITableViewCell.appearance().backgroundColor = .white
     UITableView.appearance().backgroundColor = .white
  }
  @ObservedObject var viewModel = UserViewModel()
    var body: some View {
     
      let searchBinding = Binding<String>(get: {
                 self.searchKey
             }, set: {
               self.searchKey = $0
               viewModel.filterdUsers = viewModel.filterdUsers.filter{
                 $0.name.first.lowercased().contains(self.searchKey.lowercased()) || $0.name.last.lowercased().contains(self.searchKey.lowercased()) || $0.email.lowercased().contains(self.searchKey.lowercased())
               }
               if self.searchKey.isEmpty{
                 viewModel.filterdUsers = viewModel.users
               }
               debugPrint("filter value is \(viewModel.filterdUsers)")
             })
        NavigationView {
          VStack(alignment: .center, spacing: 0){
              Spacer()
              .frame(minHeight: 40, maxHeight: 40)
              Text("Search")
              .multilineTextAlignment(.center)
              .font(.system(size: 17, weight: .bold, design: .default))
            Spacer()
            .frame(minHeight: 40, maxHeight: 40)
            ZStack(alignment: .leading){
              if searchBinding.wrappedValue.isEmpty {
                Text(searchBinding.wrappedValue.isEmpty ? " Search for name, phone, account number ..." : "")
                              .frame(maxWidth: .none,maxHeight: 45)
                              .font(.system(size: 12))
                               .foregroundColor(.black.opacity(0.7))
                               .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 20))
                
              }
              
              VStack{
                TextField(initialText, text: searchBinding)
                        .textFieldStyle(.plain)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity,maxHeight: 45)
                        .cornerRadius(8.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                          
              } .frame(maxWidth: .infinity,maxHeight: 45)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8.0)
                .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
              List(viewModel.filterdUsers,id: \.self)
                         { item in
                           let fullName = "\(item.name.title) \(item.name.first) \(item.name.last)"
                           UsersCard(nameAndUserName: "\(fullName) (\(item.login.username))", email: item.email, address: "\(item.location.street.number) \(item.location.street.name)")
                         }
            
          }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .navigationBarHidden(true)
        }.onAppear{
          for _ in 0...3{
            self.viewModel.getUser()
          }
        }
    }
  
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
      DashboardView()
    }
}
