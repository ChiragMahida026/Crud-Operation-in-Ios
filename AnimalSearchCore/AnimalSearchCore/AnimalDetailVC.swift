//
//  ViewController.swift
//  AnimalSearchCore
//
//  Created by bmiit on 12/04/22.
//

import UIKit
import CoreData

class AnimalDetailVC: UIViewController {

  
    @IBOutlet weak var AnimalName: UITextField!
    @IBOutlet weak var Description: UITextView!
    
    var selectedAnimal : Animal? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedAnimal != nil)
        {
            AnimalName.text=selectedAnimal?.animalname
            Description.text=selectedAnimal?.desc
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext=appDelegate.persistentContainer.viewContext
        let  entity=NSEntityDescription.entity(forEntityName: "Animal", in:context)
        let newAnimal = Animal(entity:entity!,insertInto: context )
        newAnimal.id=AnimalList.count as NSNumber
        newAnimal.animalname=AnimalName.text
        newAnimal.desc=Description.text
        do{
                try context.save()
            AnimalList.append(newAnimal)
            navigationController?.popViewController(animated: true)
            
            }
        catch{
            print("Context save error")
        }
        
        
    }
    
}

