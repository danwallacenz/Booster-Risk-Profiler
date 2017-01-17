//
//  Q2ViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class Q2ViewController: UIViewController {

    @IBOutlet weak var answerPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
}

extension Q2ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var title = "NOT SET"
        
        switch component {
        case 0:
            switch row {
            case 0:
                title = "Select an answer"
            case 1:
                title = "Strongly Agree"
            case 2:
                title = "Agree"
            case 3:
                title = "Neither agree or disagree"
            case 4:
                title = "Disagree"
            case 5:
                title = "Strongly Disagree"
            default:
                title = "UNKNOWN"
            }
        default:
            break
        }
        return title

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected row \(row)")
    }
}


extension Q2ViewController:UIPickerViewDataSource {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
