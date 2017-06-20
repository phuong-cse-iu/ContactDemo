//
//  ViewController.swift
//  ContactDemo
//
//  Created by gumivn002 on 6/20/17.
//  Copyright © 2017 gumivn002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnSavePressed(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let contact = Contact(context: context)
        contact.name = txtName.text
        contact.phone = txtPhone.text
        
        // save contact
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        print("Successfully added new contact")
        
    }
    
    @IBAction func btnClickPressed(_ sender: Any) {
        let contactsVC:ContactsVC = storyboard?.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
        present(contactsVC, animated: true, completion: nil)
    }

}

