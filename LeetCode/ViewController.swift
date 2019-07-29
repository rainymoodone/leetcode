//
//  ViewController.swift
//  LeetCode
//
//  Created by jack on 2018/11/19.
//  Copyright © 2018 jieWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pass))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pass() {
        //1.两数之和
//        let answer1 = TwoSum().twoSum([2,7,11,15], 9)
//        print(answer1)
        
        let temp = ListNode(9)
        temp.next = ListNode(9)
        
        let addTwoNumbersAnswer = AddTwoNumbers.addTwoNumbers(temp, ListNode(9))
        print(addTwoNumbersAnswer)

    }
}

