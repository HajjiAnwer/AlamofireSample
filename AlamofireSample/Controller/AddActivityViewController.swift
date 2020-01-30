//
//  AddActivityViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 30/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import SwiftyButton
import Validator
import PKHUD

class AddActivityViewController: UIViewController {
    
    let alamofireService = AlamofireService()
    let validatorService = ValidationService()
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
        let validationOfId = validatorService.validateID(textField: idTextField)
        let ruleLength = ValidationRuleLength(min: 3, max: 10, lengthType: .characters, error: CustomeError(message: "errorMsg"))
        let validationOfTitle = validatorService.displayValidation(textField: titleTextField, rule: ruleLength)
        let ruleDueDate = "\\d{4}\\-\\d{2}\\-\\d{1,2}T\\d{2}\\:\\d{2}\\:\\d{2}\\.\\d{2,5}\\+\\d{2}\\:\\d{2}"
        let ruleNumber = ValidationRulePattern(pattern: ruleDueDate, error: CustomeError(message:"errorMsg"))
        let validationOfDueData = validatorService.displayValidation(textField: dueDateTextField, rule: ruleNumber)
        let validationOfCompletedOrNot = validatorService.validateCompletedActivity(textField: comletedTextField)
        if validationOfId && validationOfTitle && validationOfDueData && validationOfCompletedOrNot {
            PKHUD.sharedHUD.contentView = PKHUDProgressView()
            PKHUD.sharedHUD.show()
            let param = [
                "ID" : idTextField.text,
                "Title" : titleTextField.text,
                "DueDate" : dueDateTextField.text,
                "Completed" : comletedTextField.text
                ] as! [String : String]
            alamofireService.addData(param: param) {
                PKHUD.sharedHUD.hide()
                HUD.flash(.success, delay: 5.0)
                self.modifieTextField(textField: self.idTextField)
                self.modifieTextField(textField: self.titleTextField)
                self.modifieTextField(textField: self.dueDateTextField)
                self.modifieTextField(textField: self.comletedTextField)
            }
        }
    }
    func modifieTextField (textField: UITextField){
        textField.text = ""
        textField.textColor = UIColor.black
    }
}
