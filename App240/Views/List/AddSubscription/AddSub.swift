//
//  AddSub.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct AddSub: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = ListViewModel()
    
    @AppStorage("money") var money: Int = 0
    @AppStorage("allSum") var allSum: Int = 0
    @AppStorage("averCost") var averCost: Int = 0
    @AppStorage("totSub") var totSub: Int = 0
    @AppStorage("grown") var grown: Int = 0
    
    var selectedUser: String
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Apple One")
                                    .foregroundColor(viewModel.subName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.subName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.subName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)
                                
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .padding(2)
                            .padding(.bottom)
                        
                        Text("Price")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100")
                                    .foregroundColor(viewModel.subPrice.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.subPrice.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.subPrice)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)
                                
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
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
                        .padding(3)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(2)
                        .padding(.bottom)
                        
                        Text("Free trial period (days)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("3")
                                    .foregroundColor(viewModel.subTrialPeriod.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.subTrialPeriod.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.subTrialPeriod)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)
                                
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .padding(2)
                            .padding(.bottom)
                        
                        Text("Date of payment")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {

                            DatePicker("Date of payment", selection: $viewModel.paymentDate, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(2)
                        .padding(.bottom)
                        
                        Text("Start date")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {

                            DatePicker("Start date", selection: $viewModel.startDate, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(2)
                        .padding(.bottom)
                        
                        Text("Note")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Description...")
                                    .foregroundColor(viewModel.subDescription.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.subDescription.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.subDescription)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)
                                
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .padding(2)
                            .padding(.bottom)

                    }
                }
                
                Button(action: {
                    
                    viewModel.addSubscription(selectedUser: selectedUser, completion: {
                        
                        viewModel.fetchSubscriptions()
                        
                        viewModel.current_user = ""
                        viewModel.current_type = ""
                    })
                    
                    money += Int(viewModel.subPrice) ?? 0
                    allSum += Int(viewModel.subPrice) ?? 0
                    totSub += 1
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .opacity(viewModel.subName.isEmpty || viewModel.subPrice.isEmpty || viewModel.subTrialPeriod.isEmpty ? 0.5 : 1)
                .disabled(viewModel.subName.isEmpty || viewModel.subPrice.isEmpty || viewModel.subTrialPeriod.isEmpty ? true : false)
                .padding(.bottom, 24)

            }
            .padding()
        }
    }
}

#Preview {
    AddSub(selectedUser: "slava")
}
