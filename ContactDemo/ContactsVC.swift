//
//  ContactsVC.swift
//  ContactDemo
//
//  Created by gumivn002 on 6/20/17.
//  Copyright © 2017 gumivn002. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbvContacts: UITableView!
    var sectionTitles:[SectionTitle] = []
    var listOfContacts:[Contact] = []
    var contactDict: Dictionary<String, [Contact]>?
    var sections: [(index: Int, length: Int, title: String)] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbvContacts.delegate = self
        tbvContacts.dataSource = self
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // fetch contacts
        do {
            
            listOfContacts = try context.fetch(Contact.fetchRequest())
       
            listOfContacts.sort(by: { (contact1, contact2) -> Bool in
                contact1.name! < contact2.name!
            })
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            var index = 0
            for i in 0..<listOfContacts.count {
                sections.append((index: i, length: Int, title: listOfContacts[i].name[listOfContacts[i].name?.startIndex]))
            }
            
            
        } catch {
            print("Fetching error")
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ContactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        let contactCell = listOfContacts[indexPath.row]
        cell.lblName.text = contactCell.name
        cell.lblPhone.text = contactCell.phone
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let delAction = UITableViewRowAction(style: .default, title: "Delete") { (row, index) in
            
            let taskToBeDeleted = self.listOfContacts[index.row]
            context.delete(taskToBeDeleted)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                self.listOfContacts = try context.fetch(Contact.fetchRequest())
            } catch {
                print("Fetch error")
            }
            
            self.tbvContacts.reloadData()
            
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (row, index) in
            print("edit")
            let editVC:EditVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as! EditVC
            editVC.contact = self.listOfContacts[index.row]
            self.present(editVC, animated: true, completion: nil)
            
        }
        // return two action when swiping from left of edge
        return [delAction, editAction]
    }
    
    // section titles 
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let sectionTitles = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
        
        return sectionTitles
    }
    
   
    

}


// get nth character
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}
