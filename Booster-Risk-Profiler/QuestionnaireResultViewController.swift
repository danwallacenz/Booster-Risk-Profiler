//
//  QuestionnaireResultViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class QuestionnaireResultViewController: UIViewController {

    @IBAction func showInvestorType(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CapitalGuaranteedFund")
        navigationController?.pushViewController(vc, animated: true)
    }
}
