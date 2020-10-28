 //
//  ContentView.swift
//  IFBooth_ios
//
//  Created by qwe on 26/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
struct Home : View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

 struct Login : View {
    @State var color = Color.black.opacity(0.4)
    @State var email = ""
    @State var pass = ""
    var body: some View {
        VStack {
            Image("jojo")
            Text("fuck off")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
        }
    }
 }
