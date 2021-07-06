//
//  ViewController.swift
//  RelizTestApp
//
//  Created by Nikita Makarov on 06.07.2021.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    // MARK: - Internal Vars
    var screenArray = ["Screen 1", "Screen 2", "Screen 3", "Screen 4" ]
    var screenName = "Screen 1" {
        didSet {
            
            if modalSegue {
                dismiss(animated: false, completion: nil)
                performSegue(withIdentifier: "ModalSegue", sender: screenName)
            } else if !modalSegue{
                dismiss(animated: false, completion: nil)
                performSegue(withIdentifier: "PopUpSegue", sender: screenName)
            }
            
        }
    }
    var modalSegue = false
    

    @IBOutlet weak var menuTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "ModalSegue" || segue.identifier == "PopUpSegue" , let presentController = segue.destination as? PresentViewController else { return }
        presentController.screenTitle = sender as! String
        presentController.delegate = self
        self.menuTitle.isHidden = true
        var index = 1
        for item in screenArray {
            
            if item == screenName { }
            else { switch index{
            case 1:
                presentController.firstButtonTitle = item
                index += 1
            case 2: presentController.secondButtonTitle = item
                index += 1
            case 3: presentController.thirdButtonTitle = item
                
            default: break
            }
                
            }
        }

    }
    

    @IBAction func screen1Button(_ sender: Any) {
        performSegue(withIdentifier: "ModalSegue", sender: screenName)
        modalSegue = true
    }
    
    
    @IBAction func screen1PopUpButton(_ sender: Any) {
        performSegue(withIdentifier: "PopUpSegue", sender: screenName)
        modalSegue = false
}


}

extension ViewController: PresentViewControllerDelegate {
    func showMenu() {
        self.menuTitle.isHidden = false
    }
    
    func changeScreen(screenName: String) {
        self.screenName = screenName
    }
}

