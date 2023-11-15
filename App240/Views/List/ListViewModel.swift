//
//  ListViewModel.swift
//  App240
//
//  Created by IGOR on 08/11/2023.
//

import SwiftUI
import CoreData
import Alamofire

final class ListViewModel: ObservableObject {

    @Published var subName = ""
    @Published var subPrice = ""
    @Published var subType = ""
    @Published var subTrialPeriod = ""
    @Published var paymentDate: Date = Date()
    @Published var startDate: Date = Date()
    @Published var subDescription = ""
    @Published var pairs: [String] = ["EURUSD", "EURJPY", "USDCHF", "USDRUB", "USDJPY"]
    @Published var current_pair = "EURUSD"
    @Published var types: [String] = ["Monthly", "Half-yearly", "Annual"]
    @Published var current_type = "Monthly"
    @Published var subscriptions: [SubModel] = []
    @AppStorage("current_user") var current_user = ""
    @AppStorage("users") var users: [String] = []
    
    func addSubscription(selectedUser: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "SubModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "SubModel", into: context) as! SubModel
        
        sub.subName = subName
        sub.subPrice = Int16(subPrice) ?? 0
        sub.subType = current_type
        sub.subTrialPeriod = subTrialPeriod
        sub.paymentDate = paymentDate
        sub.startDate = startDate
        sub.subDescription = subDescription
        sub.selectedUser = selectedUser
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchSubscriptions() {
        
        CoreDataStack.shared.modelName = "SubModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SubModel>(entityName: "SubModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.subscriptions = branch.filter{$0.selectedUser == current_user}
//            self.subscriptions = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.subscriptions = []
        }
    }
}

