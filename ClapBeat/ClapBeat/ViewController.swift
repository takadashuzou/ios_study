//
//  ViewController.swift
//  ClapBeat
//
//  Created by 高田周三 on 2020/06/12.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    //pickerViewの列の数を指定
         func numberOfComponents(in pickerView: UIPickerView) -> Int{
                     //今回は1つのカラム（手拍子の回数）のみ
                     return 1
                 }
         //カラムの要素数を指定
    func pickerView(_ _pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->
             Int{
                 //今回は１０個の要素（「１回」〜「１０回」）
                 return 10
             }
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    //clapを初期化
    let clapInstance = Clap()
    //NSMutableArry版
    var repeatNumbersForPicker = NSMutableArray()
    //Arry版
    var repeatNumbersArray: [String]  = []
    var repeatCount = Int()
    
    
        //立ち上がり時の画面で呼び出されるメソッド
        override func viewDidLoad() {
        super.viewDidLoad()
        //初期の手拍子の数として１（１回）を指定
        repeatCount = 1
            
        //Picker Viewの選択肢一覧を準備
            for i in 0 ..< 10 {
                let numberText = String(format: "%d回", i+1)
                //NSMutableArray版
                repeatNumbersForPicker[i] = numberText
                //Array版
                repeatNumbersArray.append(numberText)
            }
            //PickerViewのDelegateをselfにする
            PickerView.delegate = self
            //PickerViewのDataSourceをselfにする
            PickerView.dataSource = self
            
 
            //選択肢要素の表示文字列
            func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return repeatNumbersForPicker[row] as? String
                }
            
            func pickerpickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                //繰り返し回数は（row+1）回
                //例：4番目の要素　=> 繰り返し回数は（４＋１＝５）回
                repeatCount = row+1
            }
            

}
    @IBAction func play(_ sender: Any) {
        //Clapクラスのの中のメソッドを呼び出し、指定回数分再生
        clapInstance.repeatClap(count: repeatCount)
    }
    
    
    
}

