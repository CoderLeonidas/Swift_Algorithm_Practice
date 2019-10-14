//
//  71_simplifyPath.swift
//  算法练习与调试
//
//  Created by 罗阳 on 19/10/14.
//  Copyright © 2019年 leon. All rights reserved.
//

import Cocoa


class _71_simplifyPath: NSObject {
    public func simplifyPath(_ s:String) -> String {
        var ans:String = ""
        let paths = s.components(separatedBy: "/")
        var ansStack = [String]()
        
        for path in paths {
            if path != "" && path != "." && path != ".." {
                ansStack.append("/" + path )
            }
            
            if path == ".." && !ansStack.isEmpty {
                ansStack.removeLast()
            }
        }
        
        for item in ansStack {
            ans = ans + item
        }
        
        if ansStack.isEmpty  { return"/" }
        
        return ans
    }
}
