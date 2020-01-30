//
//  AddActivityViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 30/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import SwiftyButton

class AddActivityViewController: UIViewController {

    @IBOutlet weak var addButton: PressableButton!
    @IBOutlet weak var comletedTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.colors = .init(button: .orange, shadow: .orange)
        addButton.shadowHeight = 5
        addButton.cornerRadius = 5
    }
    @IBAction func addButtonPressed(_ sender: PressableButton) {
        
    }
}
