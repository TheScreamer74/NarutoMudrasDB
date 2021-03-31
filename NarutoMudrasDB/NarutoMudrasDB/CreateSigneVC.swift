//
//  ViewController.swift
//  NarutoMudrasDB
//
//  Created by Thomas on 03/03/2021.
//

import UIKit
import Foundation
import CoreData

class CreateSigneVC: UIViewController {
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var nameSigneTxtField: UITextField!
    @IBOutlet weak var signeImageView: UIImageView!
    

    @IBAction func valideSigneAction(_ sender: Any) {
        //Valide et ajouter le signe
        
        guard let title = nameSigneTxtField.text else {
            return //FIXME() ajouter un message d'erreur : "vous devez donner un nom a la technique"
        }
        
        guard let imageData = signeImageView.image?.pngData() else {
            return //FIXME() ajouter un message d'erreur : "vous devez selectionner une image"
        }
        
        
        
        // 1. Récupération du contexte
        let managedContext = persistentContainer.viewContext
        // 2. Création d'un `Item` (class Item: NSManagedObject)
        let item = Item(context: managedContext)
        
        
        
    }
    
    @IBAction func addImageAction(_ sender: Any) {
        //ajoute ou modifie l'image
        ImagePickerManager().pickImage(self){
            image in
            self.signeImageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

