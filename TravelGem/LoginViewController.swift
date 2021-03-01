//
//  LoginViewController.swift
//  TravelGem
//
//  Created by Peiwen Tan on 2/21/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var SearchBar: UITextField!
    
    
    @IBAction func OnSearchButton(_ sender: Any) {
     
        
        
        self.performSegue(withIdentifier: "POIlist", sender: self)
       
        
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navi = segue.destination as? UINavigationController,
           
                let dest = navi.topViewController as? TableViewController{
            dest.cityname = SearchBar.text ?? "Irvine"}
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
