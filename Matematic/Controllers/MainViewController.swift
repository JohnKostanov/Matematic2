//
//  MainViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var summaBasicButton: UIButton! {
        didSet {
            summaBasicButton.layer.cornerRadius = 25
        }
    }
    @IBOutlet var summaBasicStackView: UIStackView!
    @IBOutlet var summaBasicView: UIView! {
        didSet {
            summaBasicView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var summaBasicButtonStart: UIButton! {
        didSet {
            summaBasicButtonStart.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var subtractionBasicButton: UIButton! {
        didSet {
            subtractionBasicButton.layer.cornerRadius = 25
        }
    }
    @IBOutlet var substractionBasicStackView: UIStackView!
    @IBOutlet var substractionBasicView: UIView! {
        didSet {
            substractionBasicView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var substractionBasicButtonStart: UIButton! {
        didSet {
            substractionBasicButtonStart.layer.cornerRadius = 10
        }
    }
    
    
    
    
    // MARK: - Properties
    let summaQuestion = SummaQuestion(summaBasic: SummaBasicOne())
    let substractionQuestion = SubtractionBasicQuestion(subtractionBasic: SubtractionBasicOne())
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        summaBasicStackView.isHidden = true
        substractionBasicStackView.isHidden = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SummaBasicSegue" {
            let destinationSummaBasic = segue.destination as! QuestionViewController
            destinationSummaBasic.question = summaQuestion.performSummaBasic()
        } else if segue.identifier == "SubstractionBasicSegue" {
            let destinationSubractionBasic = segue.destination as! QuestionViewController
            destinationSubractionBasic.isQuestionSumma = false
            destinationSubractionBasic.substractionQuestion = substractionQuestion.performSummaBasic()
        }
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        summaBasicStackView.isHidden = false
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        substractionBasicStackView.isHidden = false
    }
}
