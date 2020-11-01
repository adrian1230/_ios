//
//  BottomTabBarScreenView.swift
//  IFBooth_ios
//
//  Created by qwe on 1/11/2020.
//

import SwiftUI

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
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(title)
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
