//
//  ListeSignesVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class ListeSignesVC: UIViewController {
    @IBOutlet weak var signesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signesTableView.delegate = self
        signesTableView.dataSource = self
    }

}

extension ListeSignesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        return cell
    }
    
    
}
