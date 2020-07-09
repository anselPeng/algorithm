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
    public var random: ListNode?//随机节点
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
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
    
    /*
     328. 奇偶链表
     https://leetcode-cn.com/problems/odd-even-linked-list/
     
     给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
     
     请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
     /Users/penganzhong/Desktop/algorithm/ANAlgorithm/ANSort.swift     */
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var node:ListNode? = head
        let oddListHead:ListNode = ListNode(0);
        let evenListHead:ListNode = ListNode(0);
        
        var curOddList:ListNode? = oddListHead;
        var curEvenList:ListNode? = evenListHead;
        var idx = 1
        while node != nil {
            
            let temp = node?.next
            node?.next  = nil
            if isOdd(num: idx) {
                curOddList?.next = node
                curOddList = curOddList?.next
            }else{
                curEvenList?.next = node
                curEvenList = curEvenList?.next
            }
            idx += 1
            node = temp
        }
        curOddList?.next = evenListHead.next
        return oddListHead.next
    }
    
    func isOdd(num:Int) -> Bool {
        return num%2 > 0
    }
    
    
    /*
     160. 相交链表
     https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
     编写一个程序，找到两个单链表相交的起始节点。
     
     
     */
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        
        if headA == nil
            || headB == nil{
            return nil
        }
        
        var pA = headA
        var pB = headB
        var lastA:ListNode?
        var lastB:ListNode?
        
        /*
         
         在pA到达链表尾部时将pA从定向为HeadB
         在pB到达链表尾部时将pB从定向为HeadA
         如果他们有交点。必定在下一轮遍历时相遇
         
         假设 headA链表比headB短3个
         那么 当pA到达尾部时会比pB到达尾部时少走3步，、
         当pA从定向为headB、pB从定向为headA后，pA会比pB走到第一个相同节点时多走3步，俩轮下来，pA跟pB走到相同节点的步数相等，所以，他们会相遇。
         
         */
        while pA !== pB {
            
            if pA?.next == nil {
                lastA = pA!
                pA = headB
            }else{
                pA = pA?.next
            }
            if pB?.next == nil {
                lastB = pB!
                pB = headA
            }else{
                pB = pB?.next
            }
            if (lastA != nil) && (lastB != nil) && (lastA !== lastB){
                return nil
            }
            
        }
        return pA
    }
    
    /*
     445. 两数相加 II
     https://leetcode-cn.com/problems/add-two-numbers-ii/
     给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。
     你可以假设除了数字 0 之外，这两个数字都不会以零开头。
     进阶：
     如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。
     示例：
     
     输入：(7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
     输出：7 -> 8 -> 0 -> 7
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let result  = ListNode(0)
        var array1 = Array<ListNode?>()
        var array2 = Array<ListNode?>()
        var  node = l1
        
        while node != nil {
            array1.insert(node, at: 0)
            node = node?.next
        }
        node = l2
        while node != nil {
            array2.insert(node, at: 0)
            node = node?.next
        }
        var carry = 0
        let count = max(array1.count, array2.count)
        for i in 0..<count {
            
            let n1 = array1.count>i ? array1[i]!.val : 0
            let n2 = array2.count>i ? array2[i]!.val : 0
            let sum = n1 + n2 + carry
            carry = sum>9 ? 1:0
            let node = ListNode(sum%10)
            node.next = result.next
            result.next = node
        }
        
        if carry > 0 {
            result.val = 1
            return result
        }else{
            return result.next
        }
    }
    /*
     138. 复制带随机指针的链表
     给定一个链表，每个节点包含一个额外增加的随机指针，该指针可以指向链表中的任何节点或空节点。
     
     要求返回这个链表的 深拷贝。
     
     我们用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：
     
     val：一个表示 Node.val 的整数。
     random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。
     */
    
    func copyRandomList(_ head: ListNode?) -> ListNode? {
        let result  = ListNode(0)
        
        if head == nil {
            return nil
        }
        var node = head
        //在每个原始节点后面插入其复制后的节点
        while node != nil {
            let copyNode = ListNode(node!.val)
            copyNode.next = node?.next
            node?.next = copyNode
            node = copyNode.next
        }
        
        //将复制后的random指向原始节点的下一个节点
        node = head
        while node != nil {
            let copyNode = node?.next
            copyNode?.random = node?.random?.next
            node = copyNode?.next
        }
        
        //拆分节点
        var curCopy = result
        node = head
        while node != nil {
            
            curCopy.next = node?.next
            curCopy = curCopy.next!
            node?.next = node!.next!.next
            node = node!.next
        }
        return result.next
    }
    
    
    /*
     
     剑指 Offer 22. 链表中倒数第k个节点
     https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
     输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。
     
     
     
     示例：
     给定一个链表: 1->2->3->4->5, 和 k = 2.
     返回链表 4->5.
     */
    
    //双指针法
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if head == nil {
            return nil
        }
        var first = head
        var secend:ListNode? = nil
        var i = 0

        while first != nil {
            if i >= k-1 {
                if secend != nil {
                    secend = secend?.next
                }else{
                    secend = head
                }
            }
            
            first = first?.next
            i += 1
        }
        
        return secend
    }
    
    /*
     23. 合并K个排序链表
     合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
     https://leetcode-cn.com/problems/merge-k-sorted-lists/
     示例:

     输入:
     [
       1->4->5,
       1->3->4,
       2->6
     ]
     输出: 1->1->2->3->4->4->5->6
     */
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    
        if lists.isEmpty {
            return nil
        }
        return recurseMergeList(lists, 0, lists.count-1)
    }
    
    func mergeTwoLists(l1:ListNode?,l2:ListNode?) -> ListNode? {
        let result = ListNode(0)
        var cur1 = l1
        var cur2 = l2
        var curNode = result
        while cur1 != nil
            && cur2 != nil{
                if cur1!.val < cur2!.val {
                    curNode.next = cur1
                    cur1 = cur1?.next
                }else{
                    curNode.next = cur2
                    cur2 = cur2?.next
                }
                curNode = curNode.next!
        }
        curNode.next = cur1 == nil ? cur2 : cur1
        return result.next
    }
    
    
    
       func recurseMergeList(_ lists: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
            if l == r { return lists[l] }
            if l > r { return nil }

            let middle: Int = (r + l) / 2
            let first = recurseMergeList(lists, l, middle)
            let second = recurseMergeList(lists, middle + 1, r)
            return mergeTwoLists(l1: first, l2: second)
        }

    /*
     25. K 个一组翻转链表
     https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
     给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

     k 是一个正整数，它的值小于或等于链表的长度。

     如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

      

     示例：
     
     给你这个链表：1->2->3->4->5

     当 k = 2 时，应当返回: 2->1->4->3->5

     当 k = 3 时，应当返回: 3->2->1->4->5
     说明：

     你的算法只能使用常数的额外空间。
     你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
    
     */
    
    /*思路
        双节点插头法，
    */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let result = ListNode(0)
        var node = head
        node = head
        var idx = 0
        var nodeHead = result
        var nodeLast:ListNode?
        while node != nil {
            let temp = node?.next
            if idx%k == 0 {
                if nodeLast != nil {
                    nodeHead = nodeLast!
                }
                nodeLast = node
                nodeHead.next = node
                nodeLast?.next = nil
            }else {
                node?.next = nodeHead.next
                nodeHead.next = node
            }
            
            idx += 1
            if temp == nil && idx%k > 0 {
                nodeHead.next = reverseListRecursion(nodeHead.next)
                break
            }
            node = temp
            
        }
        return result.next
       }
    
    /*思路
     双节点插头法，
     */
    func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
        let result = ListNode(0)
        
        var node = head
        var count = 0
        while node != nil {
            count += 1
            node = node?.next
        }
        let s = count%k
        node = head
        var idx = 0
        var nodeHead = result
        var nodeLast:ListNode?
        while node != nil {
            let temp = node?.next
            if idx%k == 0 {
                if nodeLast != nil {
                    nodeHead = nodeLast!
                }
                nodeLast = node
                nodeHead.next = node
                nodeLast?.next = nil
            }else {
                node?.next = nodeHead.next
                nodeHead.next = node
            }
            
            idx += 1
            if s>0 && count-s == idx {
                nodeLast?.next = temp
                break
            }
            node = temp
            
        }
        return result.next
       }


    /*
     19. 删除链表的倒数第N个节点
     https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
     给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

     示例：

     给定一个链表: 1->2->3->4->5, 和 n = 2.

     当删除了倒数第二个节点后，链表变为 1->2->3->5.
     说明：

     给定的 n 保证是有效的。

     进阶：

     你能尝试使用一趟扫描实现吗？
     */
    //方法1数组法
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
     
        let result  = ListNode(0)
        result.next = head
        var array = Array<ListNode>()
        var node:ListNode? = result
        while node != nil {
            array.append(node!)
            node = node!.next
        }
        
        node = array[array.count-n-1]
        node?.next = node?.next?.next
        
        return result.next
    }
    
    //方法2双指针法
       func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        
           let result  = ListNode(0)
           result.next = head
           var first:ListNode? = result
            var secend:ListNode? = result
            var idx = 0
           while first != nil {
            if idx >= n {
                secend = secend?.next
            }
            first = first?.next
            idx += 1
           }
           secend?.next = secend?.next?.next
           return result.next
       }
    
    
}






