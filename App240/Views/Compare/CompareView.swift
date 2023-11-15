//
//  CompareView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct CompareView: View {
    
    @StateObject var viewModel = CompareViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Compare")
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
                .padding()

                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("First subscription")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("Apple One")
                                    .foregroundColor(viewModel.name1.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.name1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name1)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                        
                        Text("Price")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100")
                                    .foregroundColor(viewModel.price1.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.price1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price1)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.current_type = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                })
                                .padding(3)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 8).fill(viewModel.current_type == index ? .white.opacity(0.2) : .white.opacity(0)))
                            }
                        }
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                        .padding(2)
                        .padding(.bottom)
                        
                        Text("Free trial period (days)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("3")
                                    .foregroundColor(viewModel.freeTrialPeriod1.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.freeTrialPeriod1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.freeTrialPeriod1)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(2)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Second subscription")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("Apple One")
                                    .foregroundColor(viewModel.name2.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.name2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name2)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                        
                        Text("Price")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100")
                                    .foregroundColor(viewModel.price2.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.price2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price2)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.current_type = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                })
                                .padding(3)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 8).fill(viewModel.current_type == index ? .white.opacity(0.2) : .white.opacity(0)))
                            }
                        }
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                        .padding(2)
                        .padding(.bottom)
                        
                        Text("Free trial period (days)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                            ZStack(alignment: .leading, content: {
                                
                                Text("3")
                                    .foregroundColor(viewModel.freeTrialPeriod2.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.freeTrialPeriod2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.freeTrialPeriod2)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)

                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                            .padding(2)
                            .padding(.bottom)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(2)
                    .padding(.bottom)
                    .padding(.horizontal)
                }
                
                NavigationLink(destination: {
                    
                    ResultView()
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
                .opacity(viewModel.name1.isEmpty || viewModel.name2.isEmpty || viewModel.freeTrialPeriod1.isEmpty || viewModel.name2.isEmpty || viewModel.name2.isEmpty || viewModel.freeTrialPeriod2.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name1.isEmpty || viewModel.name2.isEmpty || viewModel.freeTrialPeriod1.isEmpty || viewModel.name2.isEmpty || viewModel.name2.isEmpty || viewModel.freeTrialPeriod2.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    CompareView()
}
