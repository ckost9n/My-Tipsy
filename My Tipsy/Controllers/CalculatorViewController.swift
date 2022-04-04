//
//  ViewController.swift
//  My Tipsy
//
//  Created by Konstantin on 03.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    
    @IBOutlet var splitNumberLabel: UILabel!
    
    private var buttonCollection = [UIButton]()
    private var tip = 0.1
    private var numberOfPeople = 1
    private var billTotal = 0.0
    private var finalResult = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    private func setupViews() {
        buttonCollection.append(zeroPctButton)
        buttonCollection.append(tenPctButton)
        buttonCollection.append(twentyPctButton)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        for button in buttonCollection {
            button.isSelected = false
        }
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "0%"
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        tip = (Double(buttonTitleMinusPercentSign) ?? 0.0) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        guard let billString = billTextField.text else { return }
        guard let billDouble = Double(billString) else { return }
        
        let result = billDouble * (1 + tip) / Double(numberOfPeople)
        
        finalResult = String(format: "%.2f", result)
        
        performSegue(withIdentifier: "goToResultVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResultVC" else { return }
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
        
        resultVC.numberOfPeople = numberOfPeople
        resultVC.finalResult = finalResult
        resultVC.tipPercent = Int(tip * 100)
    }


}

