//
//  MainViewModel.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject {

    @AppStorage("users") var users: [String] = []
    @Published var isSelect: Bool = false
    @Published var userName = ""
    @AppStorage("current_user") var current_user = ""
    @AppStorage("money") var money: Int = 0
    @AppStorage("allSum") var allSum: Int = 0
    @AppStorage("averCost") var averCost: Int = 0
    @AppStorage("totSub") var totSub: Int = 0
    @AppStorage("grown") var grown: Int = 0

}

