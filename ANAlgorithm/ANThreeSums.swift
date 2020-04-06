//
//  ANThreeSums.swift
//  ANAlgorithm
// 三数之和
/*
 
 15. 三数之和
 
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 示例：
 
 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 https://leetcode-cn.com/problems/3sum/
 
 */
//  Created by 华盛 on 2020/4/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANThreeSums: NSObject {
    
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var resultArray:Array<Array<Int>> = [[]];
        resultArray.removeAll();
        var tempArray = nums;
        
        tempArray.sort { (a, b) -> Bool in
            return a<b;
        }
        
        let len = tempArray.count;
        if tempArray.count<3 {
            return resultArray;
        }
        
        for i in 0..<len-2 {
            if tempArray[i]>0 || tempArray[len-1]<0 {
                break;
            }
            
            if i>0 && tempArray[i]==tempArray[i-1] {
                break;
            }
            
            var j = i+1
            var k = len-1;
            while j<k {
                let a1 = tempArray[i];
                let a2  =  tempArray[j];
                let a3 = tempArray[k];
                let sum = a1+a2+a3
                if sum == 0 {
                    resultArray.append([a1,a2,a3]);
                    j+=1
                    k-=1
                    
                    while j<k && tempArray[j]==tempArray[j-1] {
                        j+=1;
                    }
                    while j<k && tempArray[k]==tempArray[k+1] {
                        k-=1;
                    }
                    
                }else{
                    
                    if sum>0 {
                        k-=1
                    }else{
                        j+=1;
                    }
                }
            }
        }
        return resultArray
    }
    
    
}
