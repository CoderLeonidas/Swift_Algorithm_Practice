//
//  3_lengthOfLongestSubstring.swift
//  算法练习与调试
//
//  Created by 罗阳 on 19/10/14.
//  Copyright © 2019年 leon. All rights reserved.
//

import Cocoa

//给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
//
//示例 1:
//
//输入: "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
//示例 2:
//
//输入: "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
//示例 3:
//
//输入: "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


//方法一：暴力法
class _3_lengthOfLongestSubstring1: NSObject {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let n = s.count
        var ans = 0
        for i in 0...n-1 {
            for j in i+1...n {
                if allUnique(s, i, j) {
                    ans = max(ans, j - i)
                }
            }
        }
        return ans
    }
    
    
    /// 判断字符串s中，start和end区间内的字符是否有重复
    private func allUnique(_ s: String, _ start: Int, _ end: Int) -> Bool {
        guard start < end && s.count > 0 else {
            return false
        }
        // 创建集合，以O(1)的速度查找和插入一个字符
        var set = Set<Character>()
        for i in start...end-1 {
            // 依次获取字符串中的字符
            let ch = s[s.index(s.startIndex, offsetBy: i)]
            print(ch)
            // 判断集合中是否已经有这个字符了，如果有就退出，表示已经重复
            if set.contains(ch) {
                return false
            } else {
                // 如果没有该字符，就直接放进集合中用于下次判断
                set.insert(ch)
            }
        }
        return true
    }
}

//方法二：滑动窗口（数组、字符串问题中的常用概念）
class _3_lengthOfLongestSubstring2: NSObject {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let n = s.count
        var set = Set<Character>()
        var ans = 0, i = 0, j = 0
        var ch: Character
        while i < n && j < n {
            ch = s[s.index(s.startIndex, offsetBy: j)]
            
            // try to extend the range[i,j]
            if !set.contains(ch) {
                set.insert(ch)
                ans = max(ans, j - i + 1)
                j += 1 // 如果字符不在集合中，就插入集合，并向后滑动j
            } else {
                set.remove(ch)
                i += 1  // 如果字符在集合中，就将位置的字符从集合中删除，并向后滑动i
            }
        }
        return ans
    }
}

//方法三：优化的滑动窗口
class _3_lengthOfLongestSubstring3: NSObject {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        let n = s.count
        var map = [Character: Int]()
        
        var ans = 0, i = 0, j = 0
        var ch: Character
        var strIdx: String.Index
        while j < n  {
            // 获取字符下标
            strIdx = s.index(s.startIndex, offsetBy: j)
            // 根据下标获取字符
            ch = s[strIdx]
            // 判断字符是否在字典中
            if map.keys.contains(ch) {
                // 将String.Index转化为Int
                let idx = strIdx.utf16Offset(in: s)
                // 更新i，也就是将滑动窗口的左边界向右移动
                i = max(idx, i)
            }
            ans = max(ans, j - i + 1)
            map[ch] = j + 1
            
            j += 1
        }
        
        return ans
    }
}
