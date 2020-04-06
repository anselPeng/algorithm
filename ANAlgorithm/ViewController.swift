//
//  ViewController.swift
//  ANAlgorithm
//
//  Created by 华盛 on 2020/4/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //排序算法
        let sort = ANSort()
        let array = [2,3,5,1,10,6,11]
        print(sort.hell(nums: array)) 
      
        //三数之和
        let threeSum = ANThreeSums()
        let sumArray = [-1,-3,-8,2,6,4,5,8,0,1,2,]
        print(threeSum.threeSum(sumArray))
        
        
    }


}

