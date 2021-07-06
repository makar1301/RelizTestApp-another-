//
//  PresentViewController.swift
//  RelizTestApp
//
//  Created by Nikita Makarov on 06.07.2021.
//

import UIKit



protocol PresentViewControllerDelegate {
    func changeScreen(screenName: String)
    func showMenu()
}

class PresentViewController: UIViewController {
   
    
   
    
    
    
    // MARK: - Internal Vars
    var screenTitle = ""
    var firstButtonTitle = ""
    var secondButtonTitle = ""
    var thirdButtonTitle = ""
    var delegate: PresentViewControllerDelegate?

    // MARK: - IBOutlets
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screenLabel.text = screenTitle
        self.firstButton.setTitle(firstButtonTitle, for: .normal)
        self.secondButton.setTitle(secondButtonTitle, for: .normal)
        self.thirdButton.setTitle(thirdButtonTitle, for: .normal)
        
        
    }
    
    
    // MARK: - IBActions
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.showMenu()
    }
    @IBAction func firstButton(_ sender: UIButton) {
        let text = firstButton.title(for: .normal)
        delegate?.changeScreen(screenName: text!)
    }
    @IBAction func secondButton(_ sender: Any) {
        let text = secondButton.title(for: .normal)
        delegate?.changeScreen(screenName: text!)
    }
    @IBAction func thirdButton(_ sender: Any) {
        let text = thirdButton.title(for: .normal)
        delegate?.changeScreen(screenName: text!)
    }
    

}
