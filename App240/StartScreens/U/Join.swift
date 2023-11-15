//
//  Join.swift
//  App240
//
//  Created by IGOR on 07/11/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 130)
                
            }
            
            VStack {
                
                Text("Join our Telegram Channel")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                Text("And trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                        .padding()
                })
            }
            .padding()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
