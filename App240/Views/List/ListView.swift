//
//  ListView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    let selectedUser: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("List")
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
                
                if viewModel.subscriptions.isEmpty {
                    
                    VStack(spacing: 7) {
                        
                        Image(systemName: "list.clipboard")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Add your first subscription")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.subscriptions, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    HStack {
                                        
                                        Text(index.selectedUser ?? "no user")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text((index.startDate ?? Date()).convertDate(format: "MMM d HH:mm"))
                                            .foregroundColor(Color("wblue"))
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.subName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Text("subscription")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("$\(index.subPrice)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text(index.subType ?? "")
                                            .foregroundColor(.white.opacity(0.8))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 6).fill(.white.opacity(0.2)))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                                .padding(2)
                                .padding(.bottom)
                                
                            }
                        }
                    }
                }
                
                NavigationLink(destination: {
                    
                    SelectUser()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("New subscription")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.bottom, 20)
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchSubscriptions()
        }
    }
}

#Preview {
    ListView(selectedUser: "efrv")
}
