//
//  ANDynamicArray.swift
//  ANAlgorithm
//
//  Created by VSPN.iMAC8 on 2020/6/8.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class Node: NSObject {
    var value: Any?
    var next: Node?
}


class ANDynamicArray: NSObject {
    var size = 0
    var first: Node?;
    subscript (Index:Int) -> Any{
        
        get{
            return getObjWithIndex(idx: Index) as Any
        }
        set{
            
        }
    }
    
    func addObject(obj:Any? ,idx:Int ){
        
        if idx>size {
            print("数组越界了：max: ",size," idx: ",idx)
            
            return
        }
        
        let newNode = Node()
        newNode.value = obj
        newNode.next = nil
        if idx == 0 {
            newNode.next = self.first
            self.first = newNode;
        }else{
            var node:Node?
//            if idx == size {
//                node = getLastNode()
//                node?.next = newNode
//            }else{
                node = getNodeWithIndex(idx: idx-1)
                let t = node?.next
                node?.next = newNode
                newNode.next = t
            //}
            
        }
        self.size += 1
    }
    
    func addObject(obj:Any?){
        let node = getLastNode()
        let newNode = Node()
        newNode.value = obj
        newNode.next = nil
        if node == nil{
            self.first = newNode
        }else{
            node?.next = newNode
        }
        self.size += 1
    }
    
    func getObjWithIndex(idx:Int) -> Any? {
        if idx >= size {
            print("数组越界了：max:%d idx:%d",size,idx)
            return nil;
        }
        var node = self.first
        for _ in 1...idx {
            node = node?.next
        }
        return node?.value
    }
    
    func getNodeWithIndex(idx:Int) -> Node? {
        if idx >= size {
            print("数组越界了：max:%d idx:%d",size,idx)
            return nil;
        }
        var node = self.first
        if idx == 0 {
            return node
        }
        for _ in 1...idx {
            node = node?.next
        }
        return node
    }
    
    
    func getLastNode() -> Node? {
        var node = self.first
        if node == nil {
            return nil;
        }
        
        while (node!.next != nil) {
            node = node?.next
        }
        return node
    }
    
    func dyn_print(){
        var node = self.first
        while node != nil {
            print(node?.value as Any)
            node = node?.next
        }
        
    }
    
    
}



