//
//  QuestionnaireResultViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class QuestionnaireResultViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.text = String(score)
        }
    }

    var score:Int = 0 {
        didSet {
            scoreLabel?.text = String(score)
        }
    }
    
    @IBAction func showInvestorType(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CapitalGuaranteedFund")
        navigationController?.pushViewController(vc, animated: true)
    }
}
