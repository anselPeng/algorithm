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
    
    //选择排序 找到第n小的数放到第n-1位
    func selectSort(nums:[Int]) -> [Int] {
        var result = nums
        for i in 0..<result.count {
            var minIdex = i
            
            for j in i+1..<result.count {
                if result[minIdex]>result[j] {
                    minIdex = j
                }
            }
            if i != minIdex {
                let temp = result[i]
                result[i] = result[minIdex]
                result[minIdex] = temp
                
            }
            
        }
        return result;
    }
    
    //堆排序
    func sortHeap(nums:[Int]) -> [Int] {
        var result = nums;
        let len = result.count
        var begin = len/2-1
        while begin>=0 {
            result = heepfy(nums: result, i: begin, len: len)
            begin -= 1
        }
        
        var end = len-1
        while end>=0 {
            result = swap(result, 0, end)
            result = heepfy(nums: result, i: 0, len: end)
            end -= 1
        }
        return result;
    }
    
    
    func heepfy(nums:[Int],i:Int,len:Int) ->  [Int]{
        var result = nums
        var parent = i
        var left = parent*2+1
        var right = left+1
        while left<len {
            var max = left
            if right<len && result[right]>result[left] {
                max = right
            }
            if result[max]>result[parent] {
                
                result = swap(result, max, parent)
                parent = max
                left = parent*2+1
                right = left+1
                
            }else{
                break;
            }
            
        }
        return result;
    }
    
    func swap(_ nums:[Int],_ idx1:Int ,_ idx2:Int) -> [Int] {
        var result = nums
        let t = result[idx1]
        result[idx1] = result[idx2]
        result[idx2] = t
        return result
    }
    
    
}
