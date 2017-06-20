//
//  EditVC.swift
//  ContactDemo
//
//  Created by gumivn002 on 6/20/17.
//  Copyright © 2017 gumivn002. All rights reserved.
//

import UIKit

class EditVC: UIViewController {
    
    @IBOutlet weak var txtNameEdited: UITextField!
    @IBOutlet weak var txtPhoneEdited: UITextField!
    var contact:Contact?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func btnEditPressed(_ sender: Any) {
        
        contact?.name = txtNameEdited.text
        contact?.phone = txtPhoneEdited.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("contact edited")
        // transit into contacts vc
         let contactsVC:ContactsVC = storyboard?.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
        self.present(contactsVC, animated: true, completion: nil)
    }

    @IBAction func btnClickPressed(_ sender: Any) {
        // transit into contacts vc
        let contactsVC:ContactsVC = storyboard?.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
        self.present(contactsVC, animated: true, completion: nil)
    }
   
    @IBAction func btnAddPressed(_ sender: Any) {
        let mainVC:ViewController = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        self.present(mainVC, animated: true, completion: nil)
    }

}
