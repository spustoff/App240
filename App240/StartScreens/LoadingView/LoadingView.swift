//
//  LoadingView.swift
//  App240
//
//  Created by IGOR on 07/11/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
