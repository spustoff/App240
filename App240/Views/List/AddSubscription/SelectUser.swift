//
//  SelectUser.swift
//  App240
//
//  Created by IGOR on 10/11/2023.
//

import SwiftUI

struct SelectUser: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = ListViewModel()
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
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
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    ForEach(viewModel.users, id: \.self) { index in
                        
                        NavigationLink(destination: {
                            
                            NewSub(selectedUser: index, index: "EURUSD")
                                .navigationBarBackButtonHidden()
                            
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
            }
            .padding()
        }
    }
}
#Preview {
    SelectUser()
}
