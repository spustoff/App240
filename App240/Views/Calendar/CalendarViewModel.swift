//
//  CalendarViewModel.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI
import CoreData

final class CalendarViewModel: ObservableObject {

    @Published var months: [String] = ["Jun", "Jul", "Aug", "Sep","Oct", "Nov", "Dec"]
    @Published var current_month = "Nov"

}

