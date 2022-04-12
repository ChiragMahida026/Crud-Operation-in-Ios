//
//  AnimalTableView.swift
//  AnimalSearchCore
//
//  Created by bmiit on 12/04/22.
//

import UIKit
import CoreData

var AnimalList = [Animal]()

class AnimalTableView:UITableViewController{
    
  var firstLoad = true
    
    override func viewDidLoad() {
        if(firstLoad)
        {
            firstLoad=false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext=appDelegate.persistentContainer.viewContext
            let request=NSFetchRequest<NSFetchRequestResult>(entityName: "Animal")
            do{
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let Animal = result as! Animal
                    AnimalList.append(Animal)
                }
            }
            catch{
                print("Fetch Failed")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let AnimalCell = tableView.dequeueReusableCell(withIdentifier: "animalCellId" , for:indexPath) as! AnimalCell
        
        let thisAnimal: Animal!
        thisAnimal = AnimalList[indexPath.row]
        
        AnimalCell.AnimalLabel.text = thisAnimal.animalname
        AnimalCell.DescriptionLabel.text=thisAnimal.desc
        return AnimalCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimalList.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editAnimal", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="editAnimal")
        {
            let indexPath = tableView.indexPathForSelectedRow!
            let animalDetail = segue.destination as? AnimalDetailVC
            let selectedAnimal: Animal!
            selectedAnimal=AnimalList[indexPath.row]
            animalDetail!.selectedAnimal = selectedAnimal
            
//            tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
        }
    }
}
