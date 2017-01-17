//
//  Q4ViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class Q4ViewController: UIViewController, Scorable {

    open var score = 0
    
    @IBOutlet weak var answerPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
    
    @IBAction func finish(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "QuestionnaireResultViewController") as? QuestionnaireResultViewController,
            let parent = parent as? QuestionnaireViewController,
            let navVC = parent.navigationController {
                navVC.pushViewController(vc, animated: true)
                vc.score = parent.score()
        }
    }
}

extension Q4ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var title = "NOT SET"
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

        switch component {
        case 0:
            switch row {
            case 0:
                score = 0
            case 1:
                score = 1
            case 2:
                score = 3
            case 3:
                score = 5
            case 4:
                score = 7
            case 5:
                score = 10
            default:
                score = 0
            }
        default:
            break
        }
        print("score is \(score)")
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
