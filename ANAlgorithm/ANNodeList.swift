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
    
    /*
     82. 删除排序链表中的重复元素 II
     https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
     给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。

     示例 1:

     输入: 1->2->3->3->4->4->5
     输出: 1->2->5
     示例 2:

     输入: 1->1->1->2->3
     输出: 2->3
     解题关键在于 申请一个头节点 处理边界问题，申请一个变量保存上一个节点，
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let myHead:ListNode = ListNode(0)
        myHead.next = head
        var current = myHead.next
        var previous:ListNode = myHead
        
        while current?.next != nil {
            if current?.val == current?.next?.val {
                while current?.val == current?.next?.val  {
                    current?.next = current?.next?.next
                }
                previous.next = current?.next
                current = current?.next
                
            } else {
                previous = current!
                current = current?.next
            }
        }
        return myHead.next
       }
    
    /*
     1171. 从链表中删去总和值为零的连续节点
    https://leetcode-cn.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
     给你一个链表的头节点 head，请你编写代码，反复删去链表中由 总和 值为 0 的连续节点组成的序列，直到不存在这样的序列为止。

     删除完毕后，请你返回最终结果链表的头节点。

     你可以返回任何满足题目要求的答案。
     */


    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        
        let myHead = ListNode(0)
        myHead.next = head
        var map = Dictionary<Int,ListNode>()
        var sum = 0
        var node:ListNode? = myHead
        //遍历第一遍，记录每个sum值出现的最后一个节点
        while node != nil {
            sum += node!.val
            map.updateValue(node!, forKey: sum)
            node = node?.next
        }
        if sum == 0 {
            return nil
        }
        sum = 0
        node = myHead
        //遍历第二遍，删除sum值重复出现的中间节点
        while node != nil {
            sum += node!.val
            node?.next = map[sum]?.next
            node = node?.next
        }
        return myHead.next
      }
}







