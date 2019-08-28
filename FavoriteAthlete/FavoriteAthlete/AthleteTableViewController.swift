import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let addAthleteSegue = "AddAthlete"
        static let editAthleteSegue = "EditAthlete"
    }

    // store information: name, age, league, and team
    var athletes: [Athlete] = [
        Athlete(name: "", age: "30", team: "UITED", league: "USAT"),
        Athlete(name: "", age: "30", team: "UITED", league: "USAT"),
        Athlete(name: "", age: "30", team: "UITED", league: "USAT"),
        Athlete(name: "", age: "30", team: "UITED", league: "USAT"),
        Athlete(name: "", age: "30", team: "UITED", league: "USAT"),
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.editAthleteSegue {
            if let destVC = segue.destination as? AthleteFormViewController {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    destVC.athlete = athletes[selectedIndexPath.row]
                }
            }
        }
    }
    
    @IBAction func unwindSegueFromAthleteForm(_ segue: UIStoryboardSegue) {
    
        let sourceVC = segue.source as! AthleteFormViewController
        let athlete = sourceVC.athlete!

        if let indexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete)
        }
        
    }

}

