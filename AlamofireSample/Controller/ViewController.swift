//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 29/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import PKHUD
import SwiftyButton


class MainViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var addButton: PressableButton!
    let alamofireService = AlamofireService()
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        alamofireService.fetchDataByID(id: id) { (activity) in
            PKHUD.sharedHUD.hide()
            self.contentLabel.text = activity.title
            self.idLabel.text = "id = " + String(activity.id)
            self.dueDateLabel.text = "dueDate is " + activity.dueDate!
            switch  activity.completed! {
                case true :
                    self.completedLabel.text = "This activity is completed"
                case false :
                    self.completedLabel.text = "This activity is not completed"
            }
            self.addButton.colors = .init(button: .orange, shadow: .orange)
            self.addButton.shadowHeight = 5
            self.addButton.cornerRadius = 5
        }
    }
}
