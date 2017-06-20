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
       
            
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            var contactsA = [Contact]()
            var contactsE = [Contact]()
            var contactsI = [Contact]()
            var contactsO = [Contact]()
            var contactsP = [Contact]()
            var contactsT = [Contact]()
            var contactsU = [Contact]()
            var contactsW = [Contact]()
            var contactsZ = [Contact]()
            var contactsNone = [Contact]()

            
            
            for contact in listOfContacts {
                let firstCharOfName: Character = contact.name![(contact.name?.startIndex)!]
                switch firstCharOfName {
                case "A":
                    contactsA.append(contact)
                    contactDict?["A"] = contactsA
                    break
                case "E":
                    
                    contactsE.append(contact)
                    contactDict?["E"] = contactsE
                    break
                case "I":
                    
                    contactsI.append(contact)
                    contactDict?["I"] = contactsI
                    break
                case "O":
                    contactsO.append(contact)
                    contactDict?["O"] = contactsO
                    break
                case "P":
                   
                    contactsP.append(contact)
                    contactDict?["P"] = contactsP
                    break
                case "T":
                    
                    contactsT.append(contact)
                    contactDict?["T"] = contactsT
                    break
                case "U":
                    
                    contactsU.append(contact)
                    contactDict?["U"] = contactsU
                    break
                case "W":
                    
                    contactsW.append(contact)
                    contactDict?["W"] = contactsW
                    break
                case "Z":
                    
                    contactsZ.append(contact)
                    contactDict?["Z"] = contactsZ
                    break
                default:
                    contactsNone.append(contact)
                    contactDict?["None"] = contactsNone
                }
                
            }
            print(contactDict?["P"]?[0])
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
        let sectionTitles = ["a", "b", "c", "d"]
        
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
