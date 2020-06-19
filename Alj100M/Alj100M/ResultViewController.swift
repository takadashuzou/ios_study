//
//  ResultViewController.swift
//  Alj100M
//
//  Created by 高田周三 on 2020/06/18.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit
import  Social
class ResultViewController: UIViewController {
    
    
    
    @IBOutlet weak var kirikukousin: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    
    
    //起動時に実行される
       override func viewDidLoad() {
           super.viewDidLoad()
           
           //CountTimerを文字列に変換してTimerlabel.textへ代入する（小数点２桁で表示）
           TimerLabel.text = NSString(format:"%.2f秒",CountTimer)as String
       }
    
    //FaceBook
    @IBAction func FacebookButton(sender: AnyObject){
        let text = "結果タイム" + TimerLabel.text!
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        composeViewController.setInitialText(text)
        self.present(composeViewController, animated: true, completion: nil)
    }
   
    //Tweet
    @IBAction func TweetButton(sender: AnyObject){
        let text = "結果タイム" + TimerLabel.text!
        let composeViewController:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        self.present(composeViewController,animated: true, completion: nil)
    }
    //Line
    @IBAction func LineButton(sender: AnyObject){
        let text = "結果タイム" + TimerLabel.text!
        let encodeMessage: String! = text.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        let messageURL: NSURL! = NSURL( string: "line://msg/text/" + encodeMessage )
        if(UIApplication.shared.canOpenURL(messageURL as URL)) {
            UIApplication.shared.openURL( messageURL as URL )
        }
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
