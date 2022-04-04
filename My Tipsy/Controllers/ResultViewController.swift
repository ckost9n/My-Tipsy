//
//  ResultViewController.swift
//  My Tipsy
//
//  Created by Konstantin on 04.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var finalResult = "0.0"
    var numberOfPeople = 1
    var tipPercent = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        totalLabel.text = finalResult
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercent)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
