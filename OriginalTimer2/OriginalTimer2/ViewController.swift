//
//  ViewController.swift
//  OriginalTimer2
//
//  Created by 高田周三 on 2020/06/25.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

  //PickerViewのデータ設定
  let timelist = [[Int](0...24), [Int](0...60), [Int](0...60)]
    let pickerdate:String! = nil
    var timeTotal:Int!
    
    
    @IBOutlet weak var timepicker: UIPickerView!
    
   
    
    //画面遷移の設定
    @IBAction func doneButtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = self.storyboard!
              let timer = storyboard.instantiateViewController(withIdentifier: "timer") as! TimerViewController
            //合計した値を遷移先(TimeViewController)に渡す処理
            timer.getTime = timeTotal

              self.present(timer, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func button(_ sender: Any) {
         total()
    }
    
    
    //起動時のPicker Viewの設定
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timepicker.dataSource = self
        timepicker.delegate = self
    }
       
    
    
    //↓以下PikerViewの定型文
    //UIPickerVewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return timelist.count
    }
    
    //UIPickerVewのデータの個数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timelist[component].count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(timelist[component][row])
    }
    
   // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             total()
    }

    //Pickerの数字をたすメソッド
    //秒換算にする処理
    func total() {
           timeTotal = timelist[0][timepicker.selectedRow(inComponent: 0)] * 60 * 60 + timelist[0][timepicker.selectedRow(inComponent: 1)] * 60 + timelist[0][timepicker.selectedRow(inComponent: 2)]

    }


}
