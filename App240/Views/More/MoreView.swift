//
//  MoreView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI
import StoreKit

struct MoreView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("More")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            SelectUserView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "person.circle")
                                .foregroundColor(.gray)
                                .font(.system(size: 20, weight: .regular))
                                .padding(9)
                                .background(Circle().fill(.white.opacity(0.1)))
                        })
                    }
                }
                .padding()
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star")
                                .foregroundColor(Color("wblue"))
                                .frame(width: 30, height: 30)
                            
                            Text("Rate app")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1LphRCVL5hUf1wo1io2Ugvi-oFI5V7KU_UsAp-JihKwI/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.text")
                                .foregroundColor(Color("wblue"))
                                .frame(width: 30, height: 30)

                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MoreView()
}
