 //
//  ContentView.swift
//  IFBooth_ios
//
//  Created by qwe on 26/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
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
            Login()
        }
    }
}

 struct Login : View {
    @State var color = Color.black.opacity(0.4)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    
    var body: some View {
        VStack {
            Image("jojo")
            Text("fuck off")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top,35)
            TextField("Email",text:self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("color"):self.color,lineWidth: 2))
                .padding(.top,25)
            HStack(spacing:15) {
                VStack{
                    if self.visible {
                        TextField("Password",text: self.$pass)
                    }
                    else {
                        SecureField("Password",text:self.$pass)
                    }
                }
                Button(action: {
                    
                }) {
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
            }
        }
        .padding(.horizontal,25)
    }
 }
