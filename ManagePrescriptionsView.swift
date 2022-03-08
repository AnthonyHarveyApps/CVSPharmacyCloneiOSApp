//
//  ManagePrescriptionsView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/5/22.
//

import SwiftUI


struct ManagePrescriptionsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            Color(UIColor(red: 226/255.0, green: 227/255.0, blue: 226/255.0, alpha: 1.000)).edgesIgnoringSafeArea(.horizontal)
            ScrollView(showsIndicators: false) {
                Spacer().frame(height: 20)
                ZStack {
                    Rectangle().foregroundColor(.white)
                        .shadow(color: .gray, radius: 2, x: 0.2, y: 0.2)
                    VStack(alignment: .leading) {
                        Text("Manage Prescriptions").foregroundColor(.black).font(.system(size: 25)).padding()
                        
                        HStack(alignment: .firstTextBaseline) {
                            VStack {
                                Image(systemName: "cross.vial").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Refill\nPrescriptions").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "bandage").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Schedule\nVaccine").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "doc.text.below.ecg").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("All\nPrescriptions").multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                        HStack {
                            VStack {
                                Image(systemName: "clock.fill").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("View Recent\nOrders").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "pills.fill").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Transfer a\nPrescription").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "doc.text.image").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Simple\nDose").multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                        HStack {
                            VStack {
                                Image(systemName: "calendar").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Prescriptions\nSchedule").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "dollarsign.circle.fill").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Prescriptions\nSavings").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "dollarsign.square").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("View Financial\nSummary").multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                        
                    }.foregroundColor(.black).font(.system(size: 9))
                    
                }.frame(width: UIScreen.width - 22)

                ZStack {
                    Rectangle().foregroundColor(.white)
                        .shadow(color: .gray, radius: 2, x: 0.2, y: 0.2)
                    VStack {
                        NavigationLink {
                            Text("View Not Yet Complete")
                        } label: {
                            Image(systemName: "person.3.fill").foregroundColor(Color(labelBlue))
                            Text("View Family Rx Access").foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                        NavigationLink {
                            Text("View Not Yet Complete")
                        } label: {
                            Image(systemName: "arrow.uturn.left.circle").foregroundColor(Color(labelBlue))
                            Text("Automatic Refills").foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                        NavigationLink {
                            Text("View Not Yet Complete")
                        } label: {
                            Image(systemName: "message.fill").foregroundColor(Color(labelBlue))
                            Text("Messaging & Alerts").foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                        NavigationLink {
                            Text("View Not Yet Complete")
                        } label: {
                            Image(systemName: "gear").foregroundColor(Color(labelBlue))
                            Text("More Settings").foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    }.padding(.horizontal)
                    
                    
                }.frame(width: UIScreen.width - 22)

                ZStack {
                    Rectangle().foregroundColor(.white)
                        .shadow(color: .gray, radius: 2, x: 0.2, y: 0.2)
                    VStack(alignment: .leading) {
                        Text("Pharmacy Tools").foregroundColor(.black).font(.system(size: 25)).padding()
                        
                        HStack(alignment: .firstTextBaseline) {
                            VStack {
                                Image(systemName: "capsule.righthalf.filled").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Identifyl\nPills").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "pills.fill").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Drug\nInteractions").multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Image(systemName: "archivebox").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Spoken\nRX").multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                        HStack {
                            VStack {
                                Image(systemName: "capsule.portrait.tophalf.filled").foregroundColor(Color(labelBlue)).font(.system(size: 45))
                                Text("Drug\nInformation").multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                        
                    }.foregroundColor(.black).font(.system(size: 9))
                    
                }.frame(width: UIScreen.width - 22)
 
                Spacer().frame(height: 25)

            }.background(Color(UIColor(red: 226/255.0, green: 227/255.0, blue: 226/255.0, alpha: 1.000)).edgesIgnoringSafeArea(.horizontal))
                .navigationBarBackButtonHidden(true)
                .toolbar {

                    ToolbarItem(placement: .principal) {
                        Text("Pharmacy")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    ToolbarItem(placement: .navigation) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.horizontal)
        }
    }
}

struct ManagePrescriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ManagePrescriptionsView()
    }
}
