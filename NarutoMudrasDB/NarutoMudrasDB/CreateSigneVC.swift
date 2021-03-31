//
//  ViewController.swift
//  NarutoMudrasDB
//
//  Created by Thomas on 03/03/2021.
//

import UIKit

class CreateSigneVC: UIViewController {
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var nameSigneTxtField: UITextField!
    @IBOutlet weak var signeImageView: UIImageView!
    

    @IBAction func valideSigneAction(_ sender: Any) {
        //Valide et ajouter le signe
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

