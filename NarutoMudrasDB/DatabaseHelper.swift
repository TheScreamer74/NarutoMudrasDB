//
//  DatabaseHelper.swift
//  NarutoMudrasDB
//
//  Created by Thomas on 31/03/2021.
//

import UIKit
import Foundation
import CoreData

//helper pour simplifier les interactions avec la base
class DataBaseHelper {
    static let shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //sauvegarde d'un mudra (signe) dans la base de donnée
    func saveMudra(nameSigne: String, imageSigne: Data) {
        
        let mudraInstance = Mudra(context: context)
        mudraInstance.title = nameSigne
        mudraInstance.image = imageSigne
        mudraInstance.creationDate = Date()
        
        do {
            try context.save()
            print("Mudra is saved")
        } catch {
            print(error.localizedDescription)
        }
   }
    
    
    func countMudra() -> Int {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mudra")
        var count = 0
        
        do {
            count = try context.count(for: fetchRequest)
           
        } catch {
            print("Error while fetching the technique")
        }

        return count
    }

    
    
    //récupération d'un mudra (signe) dans la base de donnée
    func fetchMudra() -> [Mudra] {
        
        var fetchingMudra = [Mudra]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mudra")
       
        do {
            fetchingMudra = try context.fetch(fetchRequest) as! [Mudra]
        } catch {
            print("Error while fetching the Mudra")
        }
        
        return fetchingMudra
    }
    
    func fetchSpecificMudra(name: String) -> [Mudra]{
        var fetchingMudra = [Mudra]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mudra")
        
        let predicate = NSPredicate(format: "title == %@", name)
        fetchRequest.predicate = predicate
        
        do {
            fetchingMudra = try context.fetch(fetchRequest) as! [Mudra]
        } catch {
            print("Error while fetching the Mudra")
        }
    
        return fetchingMudra
        
    }
    
    
    
    
    func saveTechnique(nameSigne: String, imageSigne: Data) {
        
        let techniqueInstance = Technique(context: context)
        techniqueInstance.title = nameSigne
//        techniqueInstance.image = imageSigne
        techniqueInstance.creationDate = Date()
        
        do {
            try context.save()
            print("Technique is saved")
        } catch {
            print(error.localizedDescription)
        }
   }

    func countTechnique() -> Int {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Technique")
        var count = 0
        
        do {
            count = try context.count(for: fetchRequest)
           
        } catch {
            print("Error while fetching the technique")
        }

        return count
    }
    
    func fetchTechnique() -> [Technique] {
        
        var fetchingTechnique = [Technique]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Technique")
       
        do {
            fetchingTechnique = try context.fetch(fetchRequest) as! [Technique]
        } catch {
            print("Error while fetching the technique")
        }
        
        return fetchingTechnique
    }
    
    
}
