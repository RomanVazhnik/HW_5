//
//  SecondViewController.swift
//  HW_5
//
//  Created by Роман Важник on 07/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    var texForUserName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = texForUserName
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
