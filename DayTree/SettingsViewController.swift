//
//  SettingsViewController.swift
//  DayTree
//
//  Created by Yoshi on 2017/08/25.
//  Copyright © 2017 Yoshi. All rights reserved.
//

import UIKit
import Accounts
import StoreKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var IntroButton: UIButton!
//    var firstLaunchDate = Date()

    let userdefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("SettingsView")
    
        // Do any additional setup after loading the view.
        
        print(self.userdefaults.string(forKey: "firstDateString"))
        
//        print("yo:", firstLaunchDate)
//        
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd"
//        let firstLaunch = (dateFormatter.date(from: String(firstLaunchDate)))
//
//        let now = Date()
//        
//        let span = firstLaunch!.timeIntervalSince(now as Date)
//        let daySpan = span/60/60/24
//        print(daySpan)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func usedDays() {
//        self.userdefaults.object(forKey: "firstLaunch") as! Date
//        self.firstLaunchDate = (self.userdefaults.object(forKey: "firstLaunch")) as! Date as NSDate
//
//        let firstLaunch = firstLaunchDate
//        let now = NSDate()
//        
//        let span = firstLaunch.timeIntervalSince(now as Date)
//        let daySpan = span/60/60/24
//        print(daySpan)
//    }
//    
    @IBAction func showReviewAlert() {
        let alert = UIAlertController(title: "Review",
                                      message: "Thank you for using DayTree. We'd love to hear your feedback!",
                                      preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(cancelAction)
        
        let reviewAction = UIAlertAction(title: "Review",
                                         style: .default,
                                         handler: {
                                            (action:UIAlertAction!) -> Void in
                                                // iOS 10.3未満の処理
                                            if let url = URL(string: "itms-apps://itunes.apple.com/app/id{アプリのID}?action=write-review") {
                                                if #available(iOS 10.0, *) {
                                                    UIApplication.shared.open(url, options: [:])
                                                }
                                                else {
                                                    UIApplication.shared.openURL(url)
                                                }
                                            }
        })
        
        alert.addAction(reviewAction)
    }
    
    @IBAction func IntroView() {
        self.performSegue(withIdentifier: "toIntroView2", sender: nil)
    }
    
    @IBAction func share() {
        
        // 共有する項目
        let shareText = "DayTree - Your life and nature, combined."
        let shareWebsite = NSURL(string: "")!
        let shareImage = UIImage(named: "Intro1.png")
        
        let activityItems = [shareText, shareWebsite, shareImage] as [Any]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityType.saveToCameraRoll,
            UIActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
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
