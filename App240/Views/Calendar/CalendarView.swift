//
//  CalendarView.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    @StateObject var nviewModel = ListViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Calendar")
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.months, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.current_month = index
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("2023")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: 12, weight: .medium))
                                }
                            })
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.15)))
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("wblue"), lineWidth: 3).opacity(viewModel.current_month == index ? 1 : 0))
                            .padding(3)
                        }
                    }
                }
                
                if viewModel.current_month != "Dec" && viewModel.current_month != "Nov" {
                    
                    VStack(spacing: 9) {
                        
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .regular))
                        
                        Text("No events")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("Select a different period or add a new subscription")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if nviewModel.subscriptions.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(nviewModel.subscriptions, id: \.self) { index in
                                    
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
                        .padding()
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .onAppear {
            
            nviewModel.fetchSubscriptions()
        }
    }
}

#Preview {
    CalendarView()
}
