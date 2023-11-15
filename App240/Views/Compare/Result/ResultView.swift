//
//  ResultView.swift
//  App240
//
//  Created by IGOR on 09/11/2023.
//

import SwiftUI

struct ResultView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = CompareViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Result")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.name1 = ""
                            viewModel.name2 = ""
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("wblue"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("wblue"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                        })
                    }
                }
                .padding(.bottom)
                
                VStack(spacing: 12) {
                    
                    if viewModel.ir == 1 {
                        
                        Text(viewModel.name1)
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                    } else {
                        
                        Text(viewModel.name2)
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                    }
                    
                    Text("\(String(format: "%.f", Double(.random(in: 10...70))))%")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("better")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding(2)
                
                VStack(spacing: 10) {
                    
                    Text("$\(String(format: "%.2f", Double(.random(in: 10...700))))")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Saving per year")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding(2)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ResultView()
}
