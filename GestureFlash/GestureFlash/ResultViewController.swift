//
//  ResultViewController.swift
//  GestureFlash
//
//  Created by 高田周三 on 2020/06/16.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var newHighScoreLabel: UILabel!
    //プレー画面から受け渡される経過時間を格納するための変数
    var time = TimeInterval()
    
    
    
    func checkHighScore(){
        //ハイスコアが更新されたかどうかの管理（スコア比較前は「偽」に）
        var newHighScore = false
        //一度「ハイスコア更新」ラベルを非表示
        newHighScoreLabel.isHidden = true
       // UserDefaultsへアクセスする
        let defaults = UserDefaults.standard
        //1位から3位までのハイスコアを取得し、double型の変数に格納
        var  highScore1 = defaults.double(forKey: "highScore1")
        var  highScore2 = defaults.double(forKey: "highScore2")
        var  highScore3 = defaults.double(forKey: "highScore3")
        //(全てのハイスコアが既にある場合)比較の結果、今回のtimeが当てはまる順位を記録に挿入
        //1位より早い場合
        if highScore1 != 0 && time <= highScore1{
            highScore3 = highScore2
            highScore2 = highScore1
            highScore1 = time
            newHighScore = true
        } else if highScore2 != 0 && time <= highScore2{
            highScore3 = highScore2
            highScore2 = time
            newHighScore = true
            //3位より早い場合
        } else if highScore2 != 0 && time <= highScore2{
            highScore3 =  time
            newHighScore = true
        }
            //ハイスコアがまだ格納されていない場合のtimeとの比較
            //1位がまだいない場合
        else if highScore1 == 0{
            highScore1 = time
            newHighScore = true
            //2位がまだなく、1位より遅い場合
        } else if highScore2 == 0 && time >= highScore1{
            highScore2 = time
            newHighScore = true
            //３位がまだなく、2位より遅い場合
        } else if highScore3 == 0 && time >= highScore2{
            highScore3 = time
            newHighScore = true
        }
        
        //新しいハイスコアをUser Defaultsに保存
        defaults.set(highScore1, forKey: "highScore1")
        defaults.set(highScore2, forKey: "highScore2")
        defaults.set(highScore3, forKey: "highScore3")
        
        //もし、ハイスコアが更新された場合は「ハイスコア更新」ラベルを表示
        if newHighScore == true{
            newHighScoreLabel.isHidden = false
        }

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //タイムを表示
        timeLabel.text = String(format: "%.3f 秒", time)
        //ハイスコアの判定
        self.checkHighScore()
        // Do any additional setup after loading the view.
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
