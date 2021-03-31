//
//  DetailTechniqueVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class DetailTechniqueVC: UIViewController {
    @IBOutlet weak var TechniqueImage: UIImageView!
    @IBOutlet weak var signesTableView: UITableView!
    @IBOutlet weak var nomeVillageTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signesTableView.delegate = self
        signesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailTechniqueVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        return cell
    }
    
    
}
