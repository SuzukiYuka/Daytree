//
//  PlanetViewController.swift
//  DayTree
//
//  Created by Yoshi on 2017/09/17.
//  Copyright © 2017 Yoshi. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {
    
    @IBOutlet var betterPlanetImageView: UIImageView!
    @IBOutlet var reStartButton: UIButton!
    @IBOutlet var tapLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 5.0) { () -> Void in
            self.betterPlanetImageView.alpha = 1.0
        }
        
        UIView.animate(withDuration: 7.0) { () -> Void in
            self.tapLabel.alpha = 1.0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToView () {
        performSegue(withIdentifier: "reStart", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
