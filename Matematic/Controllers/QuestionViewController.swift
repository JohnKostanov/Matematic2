//
//  QuestionViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var summaBasicStackView: UIStackView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var numbersInputLabel: UILabel!
    @IBOutlet var numbersButtons: [UIButton]!
    
    
    // MARK: - Properties
    let summaQuestion = SummaQuestion(summaBasic: SummaBasicOne())
    let substraction = SubtractionBasicQuestion(subtractionBasic: SubtractionBasicOne())
    
    var answer: String = ""
    var questionIndex = 0
    var question: [Question]!
    var substractionQuestion: [SubtractionQuestion]!
    var isQuestionSumma = true
    
    var questionType = QuestionType.summa
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Custom Methods
    func nextQuestion() {
        questionIndex += 1
    }
    
    func updateUI() {
        
        switch questionType {
        case .summa:
            question = summaQuestion.performSummaBasic()
            questionLabel.text = question[questionIndex].questionText
            answer = String(question[questionIndex].answer)
        case .substraction:
            substractionQuestion = substraction.performSummaBasic()
            questionLabel.text = substractionQuestion[questionIndex].questionText
            answer = String(substractionQuestion[questionIndex].answer)
        }
  
        nextQuestion()
    }
    
    // MARK: - Actions
    @IBAction func numbersAnswer(_ sender: UIButton) {
        guard let numbersText = sender.titleLabel?.text else { return }
        numbersInputLabel.text! += numbersText
    }
    
    @IBAction func deleteTextAction(_ sender: UIButton) {
        numbersInputLabel.text = ""
    }
    
    @IBAction func addNegativeNumbers(_ sender: UIButton) {
        numbersInputLabel.text = sender.titleLabel?.text
    }
    
    
    @IBAction func examinationButtonPressed(_ sender: UIButton) {
        if numbersInputLabel.text == answer {
            let alertController = UIAlertController(title: "Верно", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true, completion: nil)
          
            
        } else {
            let alertController = UIAlertController(title: "Правильный ответ", message: answer, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true)
            
        }
    }
    
}
