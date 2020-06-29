//
//  TimerViewController.swift
//  OriginalTimer2
//
//  Created by 高田周三 on 2020/06/25.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    //変数生成
    var timer = Timer()
    var count = 0
    var getTime:Int!
    
    //タイマーの表示
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //スタートボタン処理記述
    @IBAction func StartButton(_ sender: Any) {
        //タイマーが有効なら　何もしない
        if timer.isValid == true {
                       return
                   }
                    runTimer()
    }
    
    
    
    //ストップボタン処理記述
    @IBAction func StopButon(_ sender: Any) {
        //タイマーを止める
        timer.invalidate()
    }
    
    
    
    //リセットボタン処理記述
    @IBAction func ResetButton(_ sender: Any) {
        //タイマーを止めて0にする
        timer.invalidate()
        count = 0
        timerLabel.text = timeString(time: TimeInterval(getTime))
    }
    
    
    //戻る処理記述
    @IBAction func backButton(_ sender: Any) {
        //前画面に戻る
        let storyboard: UIStoryboard = self.storyboard!
        let picikerboard = storyboard.instantiateViewController(withIdentifier: "pickerboard") as! ViewController

        self.present(picikerboard, animated: true, completion: nil)
    }
    
    
    
       // カウントダウンをする関数
    @objc func updateTimer() -> Int {
        count += 1
        //時間　＝　pickerで設定する時間　ー　count
        let remainCount = getTime! - count
        timerLabel.text = timeString(time: TimeInterval(remainCount))

    // timerLabel.text = "\(remainCount)"

    //0秒になったら止まる
        if remainCount == 0 {
            timer.invalidate()
            timerLabel.text = "00:00:00"
        }
                return remainCount
    }
    
    
    
    //タイマーを動かす関数記述
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    
    
    
    //00:00:00に変える処理記述
    //秒数で値を取得し、各単位に合わせる処理
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let second = Int(time) % 60

        return String(format: "%02d:%02d:%02d", hour, minutes, second)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {

        timerLabel.text = timeString(time: TimeInterval(getTime))
        print(getTime ?? "this is nil")

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
