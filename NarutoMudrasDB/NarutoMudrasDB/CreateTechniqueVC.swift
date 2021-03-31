//
//  CreateTechniqueVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class CreateTechniqueVC: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signeTableView.delegate = self
        signeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension CreateTechniqueVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        return cell
    }
    
    
}
