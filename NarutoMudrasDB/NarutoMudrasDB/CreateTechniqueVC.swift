//
//  CreateTechniqueVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

protocol getSignesDelegate {
    func selectionEnded(resultSignes: [Mudra])
}

class CreateTechniqueVC: UIViewController {
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var villageTextfield: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var imageTechniqueView: UIImageView!
    @IBOutlet weak var descTextfield: UITextView!
    
    var delegate: getSignesDelegate?
    
    var signes: [Mudra] = []
    
    @IBOutlet weak var signeTableView: UITableView!
    @IBOutlet weak var navBarRightButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var techniqueImage: UIImageView!

    @IBAction func addToDB(_ sender: Any) {
        
        guard let imageData = imageTechniqueView.image?.pngData() else {
            return
        }
        
        DataBaseHelper.shareInstance.saveTechnique(nameTechnique: nameTextfield.text!, imageTechnique: imageData, villageTechnique: villageTextfield.text!, userTechnique: userTextfield.text!, descTechnique: descTextfield.text!, signes: signes)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageAction(_ sender: Any) {
        ImagePickerManager().pickImage(self){
            image in
            self.techniqueImage.image = image
        }
    }
    
    @IBAction func addSigneAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Load Signes") {
            guard let listeSigneVC = segue.destination as? ListeSignesVC else {
                return
            }
            listeSigneVC.signes = self.signes
            listeSigneVC.delegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signeTableView.delegate = self
        signeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        signeTableView.reloadData()
        print(signes)
    }
    @IBAction func AddTechniqueAction(_ sender: Any) {
        
    }
    
}

extension CreateTechniqueVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        
        cell.signeNameTxt.text = signes[indexPath.row].title
        cell.signeImage.image = UIImage(data: signes[indexPath.row].image!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        //MARK: Remove row
        print("Deleted")
        
        //self.catNames.remove(at: indexPath.row)
        //self.signeTableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
}

extension CreateTechniqueVC: getSignesDelegate {
    func selectionEnded(resultSignes: [Mudra]) {
        signes = resultSignes
        signeTableView.reloadData()
    }
}

