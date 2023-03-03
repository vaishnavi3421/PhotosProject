//
//  ViewController.swift
//  againyoutube
//
//  Created by Sanjay, Vaishnavi on 21/02/23.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoVm.photo.count
    }
    
  var photoVm = photoViewModel()
    @IBOutlet weak var tableView: UITableView!
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        photoVm.fetchPhotos { [self] in
            
            self.tableView.reloadData()
            self.navigationItem.hidesBackButton = true
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
   
//    @IBAction func loginclick(_ sender: Any) {
//        self.navigationController?.popViewController( animated: true)
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
       
        cell?.textLabel?.text = "Id = \(photoVm.photo[indexPath.row].id)"
        cell?.detailTextLabel?.text = "Title = \(photoVm.photo[indexPath.row].title)"
       
        
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.id = " id = \(photoVm.photo[indexPath.row].id)"
        vc.detialtitle = "title = \(photoVm.photo[indexPath.row].title)"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
  
    
    @IBAction func logoutButton(_ sender: Any) {
        
         let logoutButton = self.storyboard?.instantiateViewController(identifier: "loginTableViewController") as? loginTableViewController
        navigationController?.pushViewController(logoutButton!, animated: true)
        
    }
    
}

