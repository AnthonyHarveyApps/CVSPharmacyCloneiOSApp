//
//  ShowCardView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI

struct ShowCardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "barcode")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: UIScreen.width * 0.88, height: UIScreen.height * 0.1)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink {
                        Text("View Not Yet Complete")
                    } label: {
                        Image(systemName: "pills.circle.fill").font(.system(size: 25)).foregroundColor(.black)
                        VStack(alignment: .leading) {
                            Text("View your Rx").foregroundColor(.black)
                            Text("Set up prescription management").foregroundColor(Color(CVSRed)).font(.caption)
                            
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }.padding()
                    
                    Divider()
                    
                    NavigationLink {
                        Text("View Not Yet Complete")
                    } label: {
                        Image(systemName: "rectangle.inset.topleft.filled").font(.system(size: 25)).foregroundColor(.black)
                        Text("Link or enroll your ExtraCare card").foregroundColor(.black)
                        
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }.padding()
                    
                    Spacer()
                }
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        Text("Checkout barcode")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

struct ShowCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCardView()
    }
}
