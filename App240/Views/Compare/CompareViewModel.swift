//
//  CompareViewModel.swift
//  App240
//
//  Created by IGOR on 10/11/2023.
//

import SwiftUI

final class CompareViewModel: ObservableObject {

    @Published var types: [String] = ["Monthly", "Half-yearly", "Annual"]
    @Published var current_type = "Monthly"
    @AppStorage("name1") var name1 = ""
    @Published var price1 = ""
    @Published var freeTrialPeriod1 = ""
    @AppStorage("name2") var name2 = ""
    @Published var price2 = ""
    @Published var freeTrialPeriod2 = ""
    @Published var ir = Double(.random(in: 1...2))
}

