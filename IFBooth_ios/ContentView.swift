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
            Text("Come Get It")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(Color("Color2"))
                .padding(.top,35)
            TextField("Email",text:self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"):self.color,lineWidth: 2))
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
                    self.visible.toggle()
                }) {
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color"):self.color,lineWidth: 2))
            .padding(.top,25)
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Forget password")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top,25)
            
            Button(action: {
                
            }) {
                Text("LogIn")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color2"))
            .cornerRadius(10)
            .padding(.top,20)
        }
        .padding(.horizontal,25)
    }
 }
