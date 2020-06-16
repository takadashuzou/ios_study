//
//  ResultViewController.swift
//  Quiz
//
//  Created by 高田周三 on 2020/06/15.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //%のラベル
    @IBOutlet weak var peecentageLabel: UILabel!
    //「レベル」のラベル
    @IBOutlet weak var levelLabel: UILabel!
    //画像のラベル
    @IBOutlet weak var levelImage: UIImageView!
    
    //クイズ画面から受け渡される値
    var correctPercentage = Int()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //正答率に応じて「一般常識レベル」の位と画像を設定
        if correctPercentage < 30 {
            levelLabel.text = "猿レベル"
            levelImage.image =  UIImage(named: "bad")
        }else if correctPercentage >= 30 && correctPercentage < 90{
            levelLabel.text = "一般人レベル"
            levelImage.image =  UIImage(named: "normal")
        }else if correctPercentage >= 90 {
            levelLabel.text = "天才レベル"
            levelImage.image =  UIImage(named: "good")
        }
        //実際の正答率を表示
        peecentageLabel.text = String(format:"%d %%", correctPercentage)
        
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
