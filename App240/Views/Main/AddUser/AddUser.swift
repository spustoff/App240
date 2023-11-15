//
//  AddUser.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct AddUser: View {
    
    @Environment(\.presentationMode) var router
    @StateObject var viewModel: MainViewModel
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add user")
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
                
                Image(systemName: "person.circle")
                    .foregroundColor(.gray)
                    .font(.system(size: 38, weight: .regular))
                    .frame(width: 150, height: 150)
                    .background(Circle().fill(.white.opacity(0.1)))
                    .padding()
                
                Text("Name")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {

                    ZStack(alignment: .leading, content: {
                        
                        Text(" ")
                            .foregroundColor(viewModel.userName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.userName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.userName)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)

                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding(2)
                .padding(.bottom)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.users.append("\(viewModel.userName)")
                    
                    viewModel.userName = ""
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.bottom)
                .opacity(viewModel.userName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.userName.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddUser(viewModel: MainViewModel())
}
