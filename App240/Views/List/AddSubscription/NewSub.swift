//
//  NewSub.swift
//  App240
//
//  Created by IGOR on 09/11/2023.
//

import SwiftUI

struct NewSub: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = ListViewModel()
    
    var selectedUser: String
    var index: String
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New subscription")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
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
                .padding()
                
                TradeChart(pair: viewModel.current_pair)
                    .disabled(true)
                
                HStack {
                    
                    HStack {
                        
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("\(String(format: "%.f", Double(.random(in: 70...90))))%")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    .padding(.leading)
                    
                    HStack {
                        
                        Image(systemName: "arrow.down.right")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("\(String(format: "%.f", Double(.random(in: 10...20))))%")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    .padding(.trailing)
                }
                
                Menu(content: {
                    
                    ForEach(viewModel.pairs, id: \.self) {index in
                        
                            
                            Button(action: {
                                
                                viewModel.current_pair = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                
                                }
                                
                            })
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text("\(viewModel.current_pair)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.horizontal)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding()
                
                NavigationLink(destination: {
                    
                    AddSub(selectedUser: selectedUser)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Select currency")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    NewSub(selectedUser: "Slava", index: "")
}
