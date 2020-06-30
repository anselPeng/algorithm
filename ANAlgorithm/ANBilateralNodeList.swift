//
//  ANBilateralNodeList.swift
//  ANAlgorithm
//
//  Created by VSPN.iMAC8 on 2020/6/22.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANBilateralNodeList: NSObject {

    public var val: Int
    public var next: ListNode?
    public var prev: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
    
    public init(array: [Int]) {
        if array.count == 0{
            //return
        }
        self.val = array.first!
        self.next = nil;
        var currentNode:ListNode?
        if array.count>1{
            for idx in 1..<array.count {
                let node = ListNode.init(array[idx])
                if currentNode == nil {
                    self.next = node
                    currentNode = node
                }else{
                    currentNode?.next = node
                    currentNode = node
                }
            }
        }
    }
}
