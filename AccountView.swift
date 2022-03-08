//
//  AccountView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ZStack {
                    Color(CVSRed)
                    VStack(spacing: 0) {
                        Text("Welcome!")
                            .font(.largeTitle)
                            .bold().foregroundColor(.white)
                        
                        ZStack {
                            HStack(spacing: 18) {

                                NavigationLink {
                                    CreateAccountView()
                                } label: {
                                    Text("Create account")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(6)
                                }.frame(width: UIScreen.width * 0.4)
                                    .foregroundColor(.white)
                                    .overlay(Rectangle().stroke(lineWidth: 2).foregroundColor(.white))

                                Button {
                                    //
                                } label: {
                                    Text("Sign in")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(6)
                                }.frame(width: UIScreen.width * 0.4)
                                    .foregroundColor(.white)
                                    .overlay(Rectangle().stroke(lineWidth: 2).foregroundColor(.white))
                            }
                        }.frame(height: 60)
                        
                        Spacer()
                        
                        List {
 
                            Section {
                                
                                Button {
                                    //
                                } label: {
                                    HStack() {
                                        Text(" extracare ").font(.caption).foregroundColor(.white).bold().padding(3).background(Color(CVSRed))
                                        Spacer()
                                        Text("Link your card or enroll").foregroundColor(Color(CVSRed)).font(.caption2)
                                        Image(systemName: "plus.circle.fill").foregroundColor(Color(CVSRed)).padding(.leading)
                                    }
                                }.padding(6)

                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    HStack(alignment: .center) {
                                        VStack(alignment: .trailing, spacing: -5) {
                                            Image(systemName: "heart").font(.system(size: 9)).foregroundColor(Color(CVSRed))
                                            Text("carepass").foregroundColor(Color(CVSRed)).bold()
                                        }
                                        Text("Learn more about membership").foregroundColor(Color(CVSRed)).font(.caption2)
                                    }
                                }.padding(6)
                            }
                            
                            Section {
                                Button {
                                    //
                                } label: {
                                    HStack() {
                                        VStack(alignment: .leading) {
                                            Text("Prescription Management").foregroundColor(.gray).bold()
                                            Text("Set up to refill and pick up Rx in the app").foregroundColor(Color(CVSRed)).font(.caption2)
                                        }
                                        Spacer()
                                        Image(systemName: "plus.circle.fill").foregroundColor(Color(CVSRed)).padding(.leading)
                                    }
                                }.padding(6)
                            }
                            
                            Section {
                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("Payments").foregroundColor(.black)
                                        Text("View details").foregroundColor(.gray).font(.caption)
                                    }
                                }.padding(6)
                            }
                            
                            Section {
                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("Alerts & notifications").foregroundColor(.black)
                                        Text("Set pharmacy, shop and in-store alerts").foregroundColor(.gray).font(.caption)
                                    }
                                    
                                }.padding(6)

                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("Digital receipt preferences").foregroundColor(.black)
                                        Text("Go paperless! Link your ExtraCare card").foregroundColor(.gray).font(.caption)
                                    }
                                    
                                }.padding(6)
                                
                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("Order history").foregroundColor(.black)
                                        Text("See all past orders and order status").foregroundColor(.gray).font(.caption)
                                    }
                                    
                                }
                                .padding(6)
                            }
                            
                            Section {
                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    Text("Support & FAQ").foregroundColor(.gray).font(.subheadline)
                                }.padding(5)
                                
                                NavigationLink {
                                    Text("View Not Yet Complete")
                                } label: {
                                    Text("Feedback").foregroundColor(.gray).font(.subheadline)
                                }.padding(5)
                                
                                NavigationLink {
                                    ZStack {
                                        Color(CVSRed).edgesIgnoringSafeArea(.all)
                                        VStack {
                                            Spacer()
                                            HStack(alignment: .bottom,spacing: 0) {
                                                Text("CVS")
                                                    .font(Font.system(size: 20, weight: .heavy))
                                                Text("Pharmacy®")
                                                    .font(Font.system(size: 14, weight: .bold))
                                                Text(" Clone App made in")
                                                Text(" SwiftUI")
                                                    .font(Font.system(size: 20, weight: .heavy))
                                            }
                                            Text("by Anthony Harvey, March 2022")
                                                .font(.caption2)
                                            Spacer()
                                            Text("This was made for practice and as a code sample. It is NOT endorsed by or affiliated with CVS Pharmacy").multilineTextAlignment(.center)
                                            Spacer()
                                        }.foregroundColor(.white)
                                            .padding()
                                    }
                                } label: {
                                    Text("Terms & Privacy").foregroundColor(.gray).font(.subheadline)
                                }.padding(5)
                            }
                        }.listRowBackground(Color.white)
                        .listStyle(.grouped)
                        
                        .background(Color.white)
                    }.background(VStack(spacing: 0) {
                        Rectangle().foregroundColor(Color(CVSRed))
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Account")
                        .bold()
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        VStack {
                            Image(systemName: "cart")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(.white)
                            Text("Cart")
                                .font(Font.system(size: 11, weight: .regular))
                                .foregroundColor(.white)
                        }
                    }
                }
            }.onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = CVSRed
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
