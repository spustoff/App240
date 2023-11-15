//
//  MainView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    @State var percentCircle: Double = 0

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Main")
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
                
                Text("Select above the user for whom you want to view statistics")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.center)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("\(viewModel.current_user)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                            
                            Spacer()
                            
                            Image(systemName: "person.circle")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        
                        ZStack {
                            
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 9)
                                .frame(width: 170)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                .stroke(Color("wblue"), lineWidth: 9)
                                .frame(width: 170)
                                .rotationEffect(.degrees(-90))
                            
                            Text("\(String(format: "%.f", calculatePercentage())) %")
                                .foregroundColor(Color("wblue"))
                                .font(.system(size: 24, weight: .bold))
                            
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading){
                                
                                Text("$\(viewModel.money)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .bold))
                                
                                Text("There's still money to be paid")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "creditcard")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding([.horizontal, .top])
                    
                    HStack {
                     
                        VStack(alignment: .leading) {
                            
                            Text("$\(viewModel.allSum)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text("Sum of all your subscriptions")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                     
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                if viewModel.totSub == 0 {
                                    
                                    Text("$0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("$\(String(format: "%.f", Double(.random(in: 1...13))))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                Text("Amount per month")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                if viewModel.totSub == 0 {
                                    
                                    Text("$0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(String(format: "%.f", Double(.random(in: 3...23))))%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                Text("Average cost")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "compass.drawing")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.trailing)
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                Text("\(viewModel.totSub)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22, weight: .semibold))
                                
                                Text("Total subscriptions")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "circle.hexagonpath")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                if viewModel.totSub == 0 {
                                    
                                    Text("0%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(String(format: "%.f", Double(.random(in: 5...38))))%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                Text("% growth (cost)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chart.xyaxis.line")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.trailing)
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                if viewModel.totSub == 0 {
                                    
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(String(format: "%.f", Double(.random(in: 1...5))))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                Text("Paid subscriptions per month")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chart.pie")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                if viewModel.totSub == 0 {
                                    
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(String(format: "%.f", Double(.random(in: 1...3))))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                Text("Unpaid for the month")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.trailing)
                    }
                    
                }
            }
        }
        .sheet(isPresented: $viewModel.isSelect, content: {
            
            SelectUserView()

        })
    }
    
    func calculatePercentage() -> Double {
        
        let value = viewModel.money
        let maxValue = 5000
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    MainView()
}
