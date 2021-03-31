//
//  ListeTechniquesVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class ListeTechniquesVC: UIViewController {
    @IBOutlet weak var techniquesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        techniquesTableView.delegate = self
        techniquesTableView.dataSource = self
    }
}

extension ListeTechniquesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TechniquesTableViewCell", for: indexPath) as! TechniquesTableViewCell
        return cell
    }
    
    
}
