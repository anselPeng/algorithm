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

        print("****斐波拉契*****")
        //for i in 0..<10 {
             print(ANFib().fib1(n: 60));
      //  }
       
        

        //排序算法
        let sort = ANSort()
        let array = [2,3,5,1,10,6,11,-1,100,80,99,25]
       // print(sort.hell(nums: array))
        print("****排序算法*****")
      //  print(sort.hashSort(nums: array, max: 12))
      //  print(sort.selectSort(nums: array))
        print(sort.sortHeap(nums: array))
      
        
        //三数之和
         print("****三数之和*****")
        let threeSum = ANThreeSums()
        let sumArray = [-1,-3,-8,2,6,4,5,8,0,1,2,]
        print(threeSum.threeSum(sumArray))
        
        var arr = [Int]()
        arr.append(1)
        
        
        let dynArray = ANDynamicArray()
        dynArray.addObject(obj: 1)
         dynArray.addObject(obj: 2)
        dynArray.addObject(obj: 3)
        dynArray.addObject(obj: 4, idx: 0)
        dynArray.addObject(obj: 5, idx: 1)
         dynArray.addObject(obj: 8, idx: 5)
        
        dynArray.dyn_print()
        print("size:",dynArray.size)
        
        
        nodeTest()
    }


    func nodeTest() {
        print("****nodeTest begin*****")
       let node = ListNode(array: [1,8,3,7,5,6,2,10])
       // let reverseNode = node.reverseList(node)
        let reverseNode = node.reverseListRecursion(node)
        node.printList()
        print("****反转*****")
        reverseNode?.printList()
         
        print("****nodeTest end*****")
    }
    
    
   
}

