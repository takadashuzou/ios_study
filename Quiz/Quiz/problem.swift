//
//  Problem.swift
//  Quiz
//
//  Created by 高田周三 on 2020/06/15.
//  Copyright © 2020 ALJ Education Plus. All rights reserved.
//

import UIKit

class Problem: NSObject {
    //問題文
    var question = String()
    //答え（「◯」なら「０」、「×」なら「１」）
    var answer = Int()
    
    func setQ(q: String, a: Int){
        question = q
        answer = a
    }
    
    func getQ() -> String {
        return question
    }
    //答えを読み出し
    func getA() -> Int {
        return answer
    }
}
