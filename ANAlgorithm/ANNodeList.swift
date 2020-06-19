//
//  ANNodeList.swift
//  ANAlgorithm
//
//  Created by VSPN.iMAC8 on 2020/6/10.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
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
    
    
    func creatListNode(array:[Int]) -> ListNode? {
        var header:ListNode?
        var currentNode:ListNode?
        for val in array {
            let node = ListNode.init(val)
            if header == nil {
                header = node
                currentNode = node
            }else{
                currentNode?.next = node
                currentNode = node
            }
        }
        
        return header
    }
    
    func deleteNode(_ node: ListNode?) {
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
    
    func printList(){
        print(self.val)
        var node = self.next
        while node != nil {
            print(node!.val)
            node = node?.next
        }
    }
    
    //链表反转
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var currentNode:ListNode = ListNode.init(head!.val)
        var oldList:ListNode = head!
        while (oldList.next != nil) {
            let node = ListNode.init(oldList.next!.val)
            node.next = currentNode
            currentNode = node
            oldList = oldList.next!
        }
        return currentNode
    }
    
    //链表反转 递归方式
    func reverseListRecursion(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHeader = reverseListRecursion(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHeader
    }
    
   /*
     141. 环形链表
  
     给定一个链表，判断链表中是否有环。
     为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
     https://leetcode-cn.com/problems/linked-list-cycle/
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return false
        }
        
        var low = head?.next
        var fast = head?.next?.next
        while (fast != nil && fast?.next != nil) {
            if low === fast {
                return true
            }
            low = low?.next
            fast = fast?.next?.next
        }
        
        return false
    }
    
    //寻找环入口
    /*142. 环形链表 II
    给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
    为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
     https://leetcode-cn.com/problems/linked-list-cycle-ii/
     a：head到入口的长度
     b: 环形程度
     s：慢指针走过的长度
     f：快指针走过的长度（速度为慢指针的两倍）
     用快慢指针寻找到对应的节点，当快慢指针第一次相遇时满足以下关系
     f = 2s
     f = s+nb
     得到 s = nb
     假设k：为指针走到节点入口的时所走的长度，则k满足以下关系
     k = a + mb (为任意正整数)
     即 k = a + nb
     由于 s = nb 所以  k = a + s
     所以 s 再走 a步 必然是环形入口点
     再找一个指针，从头部开始一步一步走，每走一步比较一下节点，当节点相等时，指针走过的步数就是节点所在的位置
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        if (head?.next == nil || head?.next?.next == nil){
            return nil;
        }
        var low = head?.next
        var fast = head?.next?.next
        while (fast != nil && fast?.next != nil) {
            if low === fast {
                fast = head
                while low !== fast {
                   low =  low?.next
                    fast = fast?.next
                }
                return fast;
                }
            low = low?.next
            fast = fast?.next?.next
        }
        return nil
    }
    
    
    
    
}

