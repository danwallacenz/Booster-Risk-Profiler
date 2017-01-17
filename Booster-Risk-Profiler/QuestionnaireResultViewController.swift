//
//  QuestionnaireResultViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class QuestionnaireResultViewController: UIViewController {
    
    @IBOutlet weak var investorTypeButton: UIButton! {
        didSet {
             investorTypeButton.setTitle(investorType?.description, for:  .normal)
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    private enum InvestorType:CustomStringConvertible {
        case unknown
        case defensive
        case conservative
        case balanced
        case balancedGrowth
        case growth
        case agressiveGrowth
        
        var description: String {
            switch self {
            case .defensive:
                return "defensive"
            case .conservative:
                return "conservative"
            case .balanced:
                return "balanced"
            case .balancedGrowth:
                return "balancedGrowth"
            case .growth:
                return "growth"
            case .agressiveGrowth:
                return "agressiveGrowth"
            default:
                return "unknown"
            }
        }
    }
    
    private var investorType: InvestorType?
    
    var score:Int = 0 {
        didSet {
            
            scoreLabel?.text = String(score)
            
            switch score {
            case 5...12:
                investorType = .defensive
            case 13...20:
                investorType = .conservative
            case 21...29:
                investorType = .balanced
            case 30...37:
                investorType = .balancedGrowth
            case 38...44:
                investorType = .growth
            case 45...50:
                investorType = .agressiveGrowth
            default:
                investorType = .unknown
            }
            
            investorTypeButton?.setTitle("\'\(investorType?.description)\'", for:  .normal)
        }
    }
    
    @IBAction func showInvestorType(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CapitalGuaranteedFund")
        navigationController?.pushViewController(vc, animated: true)
    }
}
