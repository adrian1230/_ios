//
//  ContentView.swift
//  IFBooth_ios
//
//  Created by qwe on 26/10/2020.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

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
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        NavigationView{
            VStack {
                if self.status {
                    HomeScreen()
                }
                else {
                    ZStack {
                        NavigationLink(destination: SignUp(show: self.$show),isActive:self.$show) {
                            Text("")
                        }
                        .hidden()
                        
                        Login(show:self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) {(_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct HomeScreen : View {
    var body: some View {
        VStack {
            Text("Logged")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.8))
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
                            .padding(.top,45)
                        Text("Come Get It")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color2"))
                            .padding(.top,20)
                        TextField("Email",text:self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"):self.color,lineWidth: 2))
                            .padding(.top,25)
                        HStack(spacing:15) {
                            VStack{
                                if self.visible {
                                    TextField("Password",text: self.$pass)
                                        .autocapitalization(.none)
                                }
                                else {
                                    SecureField("Password",text:self.$pass)
                                        .autocapitalization(.none)
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
                                self.resetPass()
                            }) {
                                Spacer()
                                
                                Text("Reset password")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color3"))
                            }
                        }
                        .padding(.top,10)
                        
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
                        .cornerRadius(15)
                        .padding(.top,10)
                        
                        HStack {
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Text("Come Join Us")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color3"))
                            }
                            
                        }
                        .padding(.top,10)
                        
                    }
                    .padding(.horizontal,25)
                }
                
            }
            
            if self.alert {
                ErrorViewModel(alert: self.$alert,error:self.$error)
            }
        }
    }
    
    func resetPass() {
        if self.email != "" {
            Auth.auth().sendPasswordReset(withEmail: self.email) {
                (err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                else {
                    self.error = "reset"
                    self.alert.toggle()
                    return
                }
            }
        }
        else {
            self.error = "email is empty"
            self.alert.toggle()
            return
        }
    }
    
    func verify() {
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                UserDefaults.standard.set(true,forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"),object: nil)
            }
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
     @State var alert = false
     @State var error = ""
     
     var body: some View {
        ZStack{
            ZStack(alignment: .topLeading) {
                GeometryReader {_ in
                    VStack {
                        Image("heyo").resizable()
                           .frame(width: 172.0, height: 172.0)
                           .padding(.top,45)
                       
                        Text("Hey Mate, Let's Shop!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                            .padding(.top,25)
                        TextField("Username",text:self.$username)
                            .autocapitalization(.none)
                           .padding()
                           .background(RoundedRectangle(cornerRadius: 4).stroke(self.username != "" ? Color("Color"):self.color,lineWidth: 2))
                           .padding(.top,25)
                        TextField("Email",text:self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"):self.color,lineWidth: 2))
                            .padding(.top,25)
                        HStack(spacing:15) {
                            VStack{
                                if self.visible {
                                    TextField("Password",text: self.$pass)
                                        .autocapitalization(.none)
                                }
                                else {
                                    SecureField("Password",text:self.$pass)
                                        .autocapitalization(.none)
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
                                    .autocapitalization(.none)
                               }
                               else {
                                   SecureField("Confirm Password",text:self.$repass)
                                    .autocapitalization(.none)
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
                            self.register()
                        }) {
                            Text("Register")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color2"))
                        .cornerRadius(15)
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
            
            if self.alert {
                ErrorViewModel(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
     }
    
    func register() {
        if self.email != "" {
            if self.pass == self.repass {
                Auth.auth().createUser(withEmail: self.email, password: self.pass) {
                    (res,err) in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    UserDefaults.standard.set(true,forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
            else {
                self.error = "Password is wrong"
                self.alert.toggle()
            }
        }
        else {
            self.error = "missing. Email is 'empty'"
            self.alert.toggle()
        }
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
                    Text(self.error == "reset" ? "msg" : "Err 404")
                        .font(.title)
                        .foregroundColor(self.color)
                        .fontWeight(.bold)
                }
                .padding(.horizontal,15)
                .padding(.top,15)
                
                Text(self.error == "reset" ? "reset password sent" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top,10)
                    .padding(.horizontal,15)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text(self.error == "reset" ? "ok":"Gotcha")
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
