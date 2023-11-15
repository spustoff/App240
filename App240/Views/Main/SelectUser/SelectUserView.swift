//
//  SelectUserView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct SelectUserView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Select user")
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
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        viewModel.current_user = ""
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("All users")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    ForEach(viewModel.users, id: \.self) {index in
                        
                        Button(action: {
                            
                            viewModel.current_user = index
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("\(index)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        })
                    }
                }
                
                NavigationLink(destination: {
                    
                    AddUser(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Add a new user")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    SelectUserView()
}
