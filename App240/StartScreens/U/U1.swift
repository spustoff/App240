//
//  U1.swift
//  App240
//
//  Created by IGOR on 07/11/2023.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 130)

            }
            
            VStack {
                
                Text("Control your cash flow")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                
                Text("It's all in your pocket")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
