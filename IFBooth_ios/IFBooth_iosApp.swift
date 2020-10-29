//
//  IFBooth_iosApp.swift
//  IFBooth_ios
//
//  Created by qwe on 26/10/2020.
//

import SwiftUI
import Firebase

@main
struct IFBooth_iosApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
