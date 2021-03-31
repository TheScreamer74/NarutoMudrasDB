//
//  ListeUtilisateursVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class ListeUtilisateursVC: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self
    }

}

extension ListeUtilisateursVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        return cell
    }
    
    
}
