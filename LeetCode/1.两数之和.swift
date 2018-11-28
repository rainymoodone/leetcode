//
//  1.两数之和.swift
//  LeetCode
//
//  Created by jack on 2018/11/20.
//  Copyright © 2018 jieWang. All rights reserved.
//

import Foundation

class TwoSum {
    
    init() {
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var cacheDict = [Int: Int]()
        
        for i in 0..<nums.count {
            if let result = cacheDict[target - nums[i]] {
                return [result, i]
            }
            cacheDict[nums[i]] = i
        }
        return []
    }
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        
        var tempDict = [String: [Int]]()
        //cache
        for (index, value) in nums.enumerated() {
            let valueStr = "\(value)"
            var indexArr = tempDict[valueStr]
            if indexArr == nil {
                indexArr = []
            }
            indexArr?.append(index)
            tempDict[valueStr] = indexArr
            
            let valueNumber = (valueStr as NSString).integerValue
            if (indexArr?.count == 0) {
                break
            }
            if (valueNumber == target && valueNumber == 0) {
                if (indexArr!.count >= 2) {
                    return indexArr!
                }
            } else if valueNumber * 2 == target {
                if indexArr!.count >= 2 {
                    return Array(indexArr![0...1])
                }
            } else {
                let residueNumber = target - valueNumber
                let residueStr = "\(residueNumber)"
                let residueArr = tempDict[residueStr] ?? []
                if tempDict.keys.contains(residueStr) {
                    return [indexArr!.first ?? 0, residueArr.first ?? 0]
                }
            }
        }
        return []
    }
}

