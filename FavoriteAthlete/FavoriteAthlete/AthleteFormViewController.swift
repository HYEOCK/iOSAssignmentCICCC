//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by doris on 27/08/2019.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete : Athlete?
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var ageTextField: UITextField!
    
    @IBOutlet var leagueTextField: UITextField!
    
    @IBOutlet var teamTextField: UITextField!
    fileprivate func updateView(_ athlete: Athlete) {
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let athlete = athlete {
            updateView(athlete)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "returnToTable", sender: self)
    }
//            guard let name = nameTextField.text
//            let age = ageTextField.text,
//            let league = leagueTextField.text,
//            let team = teamTextField.text
//            else { return }
    
        //athlete = Athlete(name: name, age: age, team: team, league: league)


}
