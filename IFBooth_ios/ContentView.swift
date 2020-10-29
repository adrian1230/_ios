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
    @State var show = false
    var body: some View {
        NavigationView{
            ZStack {
                NavigationLink(destination: SignUp(show: self.$show),isActive:self.$show) {
                    Text("")
                }
                .hidden()
                
                Login(show:self.$show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Login : View {
    @State var color = Color.black.opacity(0.4)
    @State var email = ""
    @State var pass = ""
    @State var alert = false
    @State var error = ""
    @State var visible = false
    @Binding var show : Bool
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader {_ in
                    VStack {
                        Image("bac").resizable()
                            .frame(width: 252.0, height: 252.0)
                            .padding(.top,25)
                        Text("Come Get It")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color2"))
                            .padding(.top,20)
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
                            
                            Button(action: {
                                
                            }) {
                                Text("Forget password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top,25)
                        
                        Button(action: {
                            self.verify()
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
                
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if self.alert {
                ErrorViewModel(alert: self.$alert,error:self.$error)
            }
        }
    }
    
    func verify() {
        if self.email != "" && self.pass != "" {
            
        }
        else {
            self.error = "Please fill in all the blank"
            self.alert.toggle()
        }
    }
}

struct SignUp : View {
     @State var color = Color.black.opacity(0.4)
     @State var email = ""
     @State var username = ""
     @State var pass = ""
     @State var repass = ""
     @State var visible = false
     @State var revisible = false
     @Binding var show : Bool
     
     var body: some View {
         ZStack(alignment: .topLeading) {
             GeometryReader {_ in
                 VStack {
                     Image("heyo").resizable()
                        .frame(width: 172.0, height: 172.0)
                        .padding(.top,25)
                    
                     Text("Hey Mate, Let's Shop!")
                         .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                         .fontWeight(.bold)
                         .foregroundColor(Color("Color"))
                         .padding(.top,25)
                     TextField("Username",text:self.$username)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.username != "" ? Color("Color"):self.color,lineWidth: 2))
                        .padding(.top,25)
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
                    
                     HStack(spacing:15) {
                        VStack{
                            if self.revisible {
                                TextField("Confirm Password",text: self.$repass)
                            }
                            else {
                                SecureField("Confirm Password",text:self.$repass)
                            }
                        }
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color"):self.color,lineWidth: 2))
                    .padding(.top,25)
                     
                     
                     Button(action: {
                         
                     }) {
                         Text("Register")
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
             
             Button(action: {
                self.show.toggle()
             }) {
                 Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color2"))
             }
             .padding()
         }
         .navigationBarTitle("")
         .navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
     }
 }
 
 struct ErrorViewModel : View {
    @State var color = Color.black.opacity(0.4)
    @Binding var alert : Bool
    @Binding var error : String
    var body : some View {
        GeometryReader{_ in
            VStack {
                HStack{
                    Text("Err 404")
                        .font(.title)
                        .foregroundColor(self.color)
                        .fontWeight(.bold)
                }
                .padding(.horizontal,15)
                .padding(.top,15)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top,10)
                    .padding(.horizontal,15)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Gotcha")
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.bottom,10)
            }
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal,25)
            .padding(.top,250)
        }
        .background(Color.gray.opacity(0.23).edgesIgnoringSafeArea(.all))
    }
 }
