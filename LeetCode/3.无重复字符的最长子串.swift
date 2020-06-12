//
//  3.无重复字符的最长子串.swift
//  LeetCode
//
//  Created by ioblabs on 8/22/19.
//  Copyright © 2019 jieWang. All rights reserved.
//

import Foundation

class LengthOfLongestSubstring {
    
    init() {
    }
    
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var count: Int = 0
        var tempS: String = ""
        s.forEach { (chr) in
            if tempS.contains(chr) {
                let offset = tempS.index(of: chr)?.encodedOffset ?? 0
                let startIndex = tempS.index(tempS.startIndex, offsetBy: offset + 1)
                tempS = String(tempS[startIndex..<tempS.endIndex])
            }
            tempS.append(chr)
            let tempCount: Int = tempS.count
            if tempCount > count {
                count = tempCount
            }
        }
        return count
        
//        var cacheKeys: [String.Element: Int] = [:]
//        var index = 0
//        var max = 0
//        s.forEach { (chr) in
//            var last: Int = 0
//            if let temp = cacheKeys[chr] {
//                last = temp
//            }
//            cacheKeys[chr] = index
//            let diff = index - last
//            if diff > max {
//                max = diff
//            }
//            index += 1
//        }
//
//        let length = index
//        cacheKeys.forEach { (item) in
//            let diff = length - item.1
//            if diff > max {
//                max = diff
//            }
//        }
//        return max

//        var cacheKeys: [String.Element] = []
//        var count: Int = 0
//        var tempS: String = s
//        if !tempS.isEmpty {
//            tempS = "\(s)\(s.last ?? Character(""))"
//        }
//        for item in tempS {
//            if cacheKeys.contains(item) {
//                let tempCount: Int = cacheKeys.count
//                if tempCount > count {
//                    count = tempCount
//                }
//                cacheKeys.removeAll()
//            }
//            cacheKeys.append(item)
//        }
//        return count
    }
}
