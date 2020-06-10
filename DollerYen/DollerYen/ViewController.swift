//
//  ViewController.swift
//  DollerYen
//
//  Created by 高田周三 on 2020/06/08.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //入力金額を扱う変数
    var input = Double()
    //換算後の金額を扱う変数
    var result = Double()
    //変換レートを扱う変数
    var  rate = Double()
    
    //「円→ドル」or 「ドル→円」の計算方法を記録するためのbool変数
    //「円→ドル」ならば「true」、「ドル→円」ならば「false」
    
    var isYenToDollar = Bool()
    
    

    //入力値の通貨の単位を表示するラベル（円 or ドル）
    @IBOutlet weak var Currency: UILabel!
        //金額を入力するテキストフィールドのインスタンス
    @IBOutlet var inputField: [UITextField]!

    //「ドル→円」or 「円→ドル」を選ぶためのSegmented Controlのインスタンス
   
    @IBOutlet weak var selector: UISegmentedControl!
    //通貨レートを表示するラベル
   
    @IBOutlet weak var rateLabel: UILabel!
    //換算後の通貨の単位を表示するラベル（円 or ドル）
    @IBOutlet weak var resultCrrency: UILabel!
    //換算後の金額を表示するラベル
    @IBOutlet weak var resultLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 変換レートを設定（例：1ドルあたり80.5円）
        rate = 120.0
        //inputとresultを0に初期化
        input = 0
        result = 0
        //retaLabelの値をrateの値に応じて更新（少数点以下1桁まで）
        rateLabel.text = String(format: "%.1f", rate)
        //初期状態の計算方法は「円→ドル」に設定
        isYenToDollar = true
    }

    //通貨換算における計算処理
    
    
    

}

