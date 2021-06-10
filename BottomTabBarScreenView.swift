//
//  BottomTabBarScreenView.swift
//  _ios
//
//  Created by qwe on 1/11/2020.
//

import SwiftUI
import Firebase

struct BottomTabBarScreenView: View {
    enum FilterType {
        case home, explore, chat, profile
    }
    let filter: FilterType
    var title: String {
        switch filter {
        case .home:
            return "home"
        case .explore:
            return "explore"
        case .chat:
            return "chat"
        case .profile:
            return "profile"
        }
    }
    var content: String {
        switch filter {
        case .home:
            return ""
        case .explore:
            return ""
        case .chat:
            return ""
        case .profile:
            return ""
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .navigationTitle(title)
                Button(action:{
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false,forKey: "status")
                    NotificationCenter.default.post(name:NSNotification.Name("status"),object:nil)
                }){
                    Text("logout")
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top,10)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct BottomTabBarScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarScreenView(filter: .home)
    }
}


