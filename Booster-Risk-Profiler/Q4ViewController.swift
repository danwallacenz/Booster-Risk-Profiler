//
//  Q4ViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class Q4ViewController: UIViewController {

    @IBOutlet weak var answerPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
}

extension Q4ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var title = "NOT SET"
        
//        Daily 1 1 1
//        Monthly 3 3 3
//        Quarterly 5 5 5
//        Annually 7 7 7
//        Never or only occasionally over the longer term 10 10 10
        
        switch component {
        case 0:
            switch row {
            case 0:
                title = "Select an answer"
            case 1:
                title = "Daily"
            case 2:
                title = "Monthly"
            case 3:
                title = "Quarterly"
            case 4:
                title = "Annually"
            case 5:
                title = "Never or only occasionally"
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


extension Q4ViewController:UIPickerViewDataSource {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
