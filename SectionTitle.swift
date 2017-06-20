//
//  ContactWithSection.swift
//  ContactDemo
//
//  Created by gumivn002 on 6/20/17.
//  Copyright © 2017 gumivn002. All rights reserved.
//

import Foundation
import UIKit

class SectionTitle {
    var contacts:[Contact]?
    var sectionTitle:Character?
    
    init(sectionTitle:Character?, contacts:[Contact]) {
       self.sectionTitle = sectionTitle
       self.contacts = contacts
    }
}
