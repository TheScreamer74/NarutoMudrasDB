//
//  ListeSignesVC.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit



class ListeSignesVC: UIViewController {
    @IBOutlet weak var signesTableView: UITableView!
    
    
    var delegate: getSignesDelegate?
    
    var signes: [Mudra] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signesTableView.delegate = self
        signesTableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            delegate?.selectionEnded(resultSignes: signes)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        signes.append(DataBaseHelper.shareInstance.fetchSpecificMudra(name: (self.signesTableView.cellForRow(at: indexPath) as! ListeSignesTableViewCell).signeNameTxt.text!)[0])
        
        print(signes)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = signes.firstIndex(of: DataBaseHelper.shareInstance.fetchSpecificMudra(name: (self.signesTableView.cellForRow(at: indexPath) as! ListeSignesTableViewCell).signeNameTxt.text!)[0]) {
            signes.remove(at: index)
        }
        print(signes)
    }
        

}

extension ListeSignesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataBaseHelper.shareInstance.countMudra()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeSignesTableViewCell", for: indexPath) as! ListeSignesTableViewCell
        
        
        let arr = DataBaseHelper.shareInstance.fetchMudra()
        
        
        cell.signeNameTxt.text = arr[indexPath.row].title
        cell.signeImage.image = UIImage(data: arr[indexPath.row].image!)
        
        for signe in signes {
            if (signe.title == cell.signeNameTxt.text){
                cell.isSelected = true
            }
        }
        
        return cell
    }
    
    
    
}


