//
//  HomeView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    @State var searchText: String = ""
    @State var isLoading: Bool = false
    @State private var scrollOffset: CGFloat = .zero
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color(CVSRed)
                        SearchBar(text: $searchText, isLoading: $isLoading)
                            .padding()
                    }.frame(height: 60)
                    
                    Spacer()
                    
                    ScrollViewOffset { scrollOffset in
                        self.scrollOffset = scrollOffset
                    } content: {
                        ZStack {
                            Color(CVSRed)
                            HStack {
                                
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    HStack {
                                        Text("At-Home\nCOVID-19\nTests").foregroundColor(.black)
                                            .font(.system(size: 13, weight: .bold))
                                            .padding(.horizontal)
                                        Spacer()
                                        Image(systemName: "house.fill")
                                            .font(.system(size: 26))
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                                .frame(width: 185, height: 60)
                                .onTapGesture {
                                    openURL(URL(string: "https://www.cvs.com/shop/content/at-home-covid-tests-education?icid=app_hp_covid_at_home")!)
                                }
                                
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    HStack {
                                        Text("Health\nDashboard &\nRecords").foregroundColor(.black)
                                            .font(.system(size: 13, weight: .bold, design: .rounded))
                                            .padding(.horizontal)
                                        Spacer()
                                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                                            .font(.system(size: 26))
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                                .frame(width: 185, height: 60)
                                .onTapGesture {
                                    openURL(URL(string: "https://www.cvs.com/retail-easy-account/lookup/covax?cid=oc_app_cvd_hm_vcnrc")!)
                                }
                            }.padding()
                                .frame(height: 80)
                        }.background(Color.yellow)
                        VStack {
                            HStack {
                                SquareBlockView(title: "COVID-19 Tests", text: "Schedule a\nCOVID-19 Test", imageName: "snowflake.circle")
                                    .onTapGesture {
                                        openURL(URL(string: "https://www.cvs.com/content/coronavirus?icid=app_cvd_hm_fndtst_srv")!)
                                    }

                                SquareBlockView(title: "Vaccinations", text: "Schedule a\nCOVID-19 Vaccine", imageName: "cross.vial.fill", primaryColor: .gray)
                                    .onTapGesture {
                                        openURL(URL(string: "https://www.cvs.com/vaccine/intake/store/covid-screener/covid-qns")!)
                                    }
                            }.padding(.top)
                            
                            HStack {
                                
                                NavigationLink {
                                    ManagePrescriptionsView()
                                } label: {
                                    SquareBlockView(title: "Pharmacy", text: "", imageName: "cross.vial", primaryColor: .orange, secondaryColor: .black)
                                }

                                SquareBlockView(title: "Deals & Rewards", text: "Link or enroll\nExtraCare card", imageName: "banknote", primaryColor: Color(CVSRed), secondaryColor: .gray)
                                
                            }
                            
                            HStack {
                                SquareBlockView(title: "MinuteClinic", text: "Plan a visit", imageName: "person.2.fill", primaryColor: Color(red: 0.48, green: 0.29, blue: 0.0), secondaryColor: Color(red: 0.83, green: 0.51, blue: 0.00))

                                SquareBlockView(title: "Shop", text: "Free shipping on orders $35+", imageName: "cart.fill", primaryColor: .gray)
                                
                            }

                            HStack {
                                SquareBlockView(title: "Photo", text: "", imageName: "photo.on.rectangle.angled", primaryColor: .blue, secondaryColor: .green)

                                SquareBlockView(title: "Weekly Ad", text: "View your weekly ad", imageName: "newspaper.fill", primaryColor: .gray)
                                
                            }
                            
                            RectangleBlockView(title: "CarePass", text: "20% off CVS Health brand products, Free same-day RX delivery and more", bottomText: "Join now - first month FREE!", imageName: "heart").padding(.vertical, 8)
                                .onTapGesture {
                                    openURL(URL(string: "https://www.cvs.com/carepass/join?icid=cvs-home-carepass-app")!)
                                }
                            
                            RectangleBlockView(title: "CVS HealthHUB", text: "Expanded health services and wellness products for you and your family", bottomText: "Learn more about CVS HealthHub", imageName: "doc.on.clipboard.fill", primaryColor: .blue, secondaryColor: .black).padding(.vertical, 4)
                                .onTapGesture {
                                    openURL(URL(string: "https://www.cvs.com/content/health-hub")!)
                                }
                        }
                        Spacer().frame(height: 25)
                    }
                    .background(VStack(spacing: 0) {
                        ZStack {
                            Rectangle().foregroundColor(Color(CVSRed))
                                .frame(height: scrollOffset < -30 ? 0 : (40 + scrollOffset))
                            if scrollOffset > 100 {
                                ActivityIndicator(style: .medium, animate: .constant(true)).padding(.bottom)
                            }
                        }
                        Rectangle().foregroundColor(.white)
                    })
                }.background(VStack(spacing: 0) {
                    Rectangle().foregroundColor(Color(CVSRed))
                })
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(alignment: .bottom,spacing: 0) {
                        Image(systemName: "heart.fill")
                            .font(Font.system(size: 15, weight: .bold))
                        Text("CVS")
                            .font(Font.system(size: 20, weight: .heavy))
                        Text("Pharmacy®")
                            .font(Font.system(size: 14, weight: .bold))
                    }.foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        VStack {
                            Image(systemName: "bell")
                                .font(Font.system(size: 12, weight: .bold))
                            
                            Text("Notifications")
                                .font(Font.system(size: 10, weight: .regular))
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        VStack {
                            Image(systemName: "cart")
                                .font(Font.system(size: 12, weight: .bold))
                            Text("Cart")
                                .font(Font.system(size: 10, weight: .regular))
                        }
                    }
                }
            }.tint(.white)
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundColor = CVSRed
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


