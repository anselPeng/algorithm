//
//  ANSort.swift
//  ANAlgorithm
//  排序算法
//  Created by 华盛 on 2020/4/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANSort: NSObject {

    
    //冒泡排序
      func maopao(_ nums:Array<Int>) -> Array<Int> {
          
          var result = nums
          let count = nums.count
          for i in 0..<nums.count-1 {
              for j in i+1..<count {
                  if result[i] > result[j] {
                      let temp = result[i];
                      result[i] = result[j]
                      result[j] = temp
                  }
                  
              }
          }
          return result
      }
      
      //插入排序
      func insert(_ nums:Array<Int>) -> Array<Int> {
          var result = [Int]()
          
          if nums.count>0 {
              result.append(nums.first!)
          }else{
              return result
          }
          
          for i in 1..<nums.count {
              if result.count>0 && nums[i] >= result.last!{
                  result.append(nums[i])
              }else{
                  for j in 0..<result.count {
                      if nums[i] <= result[j]  {
                          result.insert(nums[i], at: j)
                          break
                      }
                  }
                  
              }
              
          }
          return result
      }
      
      //快排
      func quick(array:Array<Int>,left:Int,right:Int ) -> Array<Int> {
          var reslut  = array
          if reslut.count == 0 {
              return reslut
          }
          if left>right {
              return reslut
          }
          
          var l = left
          var r = right
          let key = reslut[left]
          
          while l != r {
              
              while l<r && reslut[r]>=key {
                  r -= 1
              }
              
              while l<r && reslut[l]<=key {
                  l += 1
              }
              
              if l<r {
                  let t = reslut[l]
                  reslut[l] = reslut[r]
                  reslut[r] = t
              }
          }
          
          reslut[left] = reslut[l]
          reslut[l] = key
          reslut = quick(array: reslut, left: left, right: l-1)
          reslut = quick(array: reslut, left: l+1, right: right)
          return reslut
      }
      
      //希尔排序
      func hell(nums:Array<Int>) -> [Int] {
          var result  = nums
          let len = nums.count
          var node = nums.count/2
          while node>0 {
              for i in node..<len {
                  var j = i-node
                  let temp = result[i]
                  while (j>=0 && temp<result[j]) {
                      result[j+node] = result[j]
                      j=j-node
                  }
                  result[j+node] = temp
              }

              node = node/2
          }
          return result
      }
    
    //哈希排序
    func hashSort(nums:[Int],max:Int) -> [Int] {
    
        var indxArray = [Int]()
        var result = [Int]()
        for _ in 0..<max {
            indxArray.append(0)
        }
        for i in 0..<nums.count {
            indxArray[nums[i]] += 1
        }
        
        for i in 0..<max {
            var count = indxArray[i]
            while count>0 {
                result.append(i)
                count -= 1
            }
            
        }

        return result
    }
        
    
    
    
}
