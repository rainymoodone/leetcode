//
//  2.两数相加.swift
//  LeetCode
//
//  Created by jack on 2018/11/20.
//  Copyright © 2018 jieWang. All rights reserved.
//

import Foundation

class AddTwoNumbers {
    
    init() {
    }
    
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        // 为空判断
        if l1 == nil && l2 == nil {
            return nil
        }

        let lval1: Int = l1?.val ?? 0
        let lval2: Int = l2?.val ?? 0
        
        var lnTemp1: ListNode? = l1?.next
        let lnTemp2: ListNode? = l2?.next
        
        var currentInt: Int = lval1 + lval2
        if currentInt >= 10 {
            currentInt -= 10
            if lnTemp1 == nil {
                lnTemp1 = ListNode(1)
            } else {
                lnTemp1?.val = (lnTemp1?.val ?? 0) + 1
            }
        }
        
        let currentNode: ListNode? = ListNode(currentInt)
        
        if lnTemp1 != nil && lnTemp2 != nil {
            currentNode?.next = addTwoNumbers(lnTemp1, lnTemp2)
        } else if lnTemp1 != nil {
            if (lnTemp1?.val ?? 0) >= 10 {
                currentNode?.next = addTwoNumbers(lnTemp1, lnTemp2)
            } else {
                currentNode?.next = lnTemp1
            }
        } else if lnTemp2 != nil {
            if (lnTemp2?.val ?? 0) >= 10 {
                currentNode?.next = addTwoNumbers(lnTemp1, lnTemp2)
            } else {
                currentNode?.next = lnTemp2
            }
        }
        return currentNode
    }
    
    class func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var resultN: ListNode?
        var cursorN: ListNode?
    
        var addNum: Int = 0
        var ln1: ListNode? = l1
        var ln2: ListNode? = l2
        
        while ln1 != nil || ln2 != nil {
            let sum: Int = (ln1?.val ?? 0) + (ln2?.val ?? 0) + addNum
            let currentN = ListNode(sum%10)
            if resultN == nil {
                resultN = currentN
                cursorN = currentN
            } else {
                cursorN?.next = currentN
                cursorN = currentN
            }
            addNum = sum/10
            if ln1 != nil {
                ln1 = ln1?.next
            }
            if ln2 != nil {
                ln2 = ln2?.next
            }
        }
        
        if addNum != 0 {
            cursorN?.next = ListNode(addNum)
        }
        
        return resultN
    }
}
