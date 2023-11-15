//
//  R2.swift
//  App240
//
//  Created by IGOR on 07/11/2023.
//

import SwiftUI

struct R2: View {
    
    var body: some View {
 
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 130)
            }
            
            VStack {
                
                Text("Add multiple users")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                
                Text("Your family members or friends")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
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
    R2()
}
