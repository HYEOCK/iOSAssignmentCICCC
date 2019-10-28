//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by doris on 2019/10/25.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        var frequencyOfANswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map{$0.type}
        
        for response in responseTypes {
//            let newCount: Int
//            if let oldCount = frequencyOfANswers[response] {
//                newCount = oldCount + 1
//            } else {
//                newCount = 1
//            }
//            frequencyOfANswers[response] = newCount
            frequencyOfANswers[response] = (frequencyOfANswers[response] ?? 0) + 1
        }
        
//        let frequentAnswersSorted = frequencyOfANswers.sorted(by: {(pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        })
        let frequentAnswersSorted = frequencyOfANswers.sorted {$0.value > $1.value}
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.dafinition
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ResultsSegue" {
//            
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
