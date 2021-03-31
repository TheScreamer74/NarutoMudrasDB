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
    
    var delegate: getSignesDelegate?
    
    var signes: [Mudra] = []
    
    @IBOutlet weak var signeTableView: UITableView!
    @IBOutlet weak var navBarRightButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var techniqueImage: UIImageView!
    
    @IBAction func navBarRightAction(_ sender: Any) {
    }
    
    @IBAction func addImageAction(_ sender: Any) {
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
    
    
}

extension CreateTechniqueVC: getSignesDelegate {
    func selectionEnded(resultSignes: [Mudra]) {
        signes = resultSignes
        signeTableView.reloadData()
    }
}

