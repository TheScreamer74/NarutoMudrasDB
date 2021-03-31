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
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
   }
    
    
    //récupération d'un mudra (signe) dans la base de donnée
    func fetchMudra() -> [Mudra] {
        
        var fetchingMudra = [Mudra]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mudra")
       
        do {
            fetchingMudra = try context.fetch(fetchRequest) as! [Mudra]
        } catch {
            print("Error while fetching the image")
        }
        
        return fetchingMudra
    }
    
}
