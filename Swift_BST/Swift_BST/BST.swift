//
//  BST.swift
//  Swift_BST
//
//  Created by leon on 2019/10/10.
//  Copyright © 2019 Leonidas. All rights reserved.
//

import Cocoa


// 节点定义
public class TreeNode  {
    var E: Int
    var left: TreeNode?
    var right: TreeNode?
    init(E: Int) {
        self.E = E
        self.left = nil
        self.right = nil
    }

}

class BST : NSObject {
    public typealias Node = TreeNode
    public var root: Node?
    public var count: Int = 0
   
    override init() {
        super.init()
    }
    
    func isEmpty()-> Bool {
        return count == 0
    }
    
    private func maxDepth(_ root : Node?)->Int{
        guard let root = root else{
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right))+1
    }
    
    func maxDepth()->Int{
        return maxDepth(root)
    }
    
    public func add(E:Int) {
        if root == nil {
            root = Node(E: E)
            count += 1
        }else{
            addNode(E: E, node: root!)
        }
    }
    
    // 向以node为根的二分搜索树中插入元素e，递归算法
    private
    func addNode(E:Int, node:Node) {
        //递归用法，先判断结束语句
        if node.E == E {
            return
        }else if((E < node.E) && (node.left == nil)){
            //遍历到最后，添加左叶子
            node.left = Node(E: E)
            count += 1
            return
        }else if((E > node.E) && (node.right == nil)){
            //遍历到最后，添加右叶子
            node.right = Node(E: E)
            count += 1
            return
        }
        
        //递归调用
        if E < node.E {
            addNode(E: E, node: (node.left)!)
        }else{
            addNode(E: E, node: (node.right)!)
        }
    }
    
    //查看二分搜索树中是否包含某个元素
    public func contain(E:Int) -> Bool {
        return containNode(E: E, node: root)
    }

    // 看以node为根的二分搜索树中是否包含元素e, 递归算法
    private
    func containNode(E:Int, node:Node?) -> Bool {
        if node == nil {
            return false
        }

        if node?.E == E {
            return true
        }else if (node?.E)! > E {
            //左
            return containNode(E: E, node: node?.left )
        }else{
            //右
            return containNode(E: E, node: node?.right)
        }
    }
    
    //二分搜索树的前序遍历
    public func preOrder() {
        print("preOrder\n")
        preOrder(node: root)
    }
    // 前序遍历以node为根的二分搜索树, 递归算法
    private
    func preOrder(node:Node?) {
        //结束条件
        if node == nil {
            return
        }
        print(node?.E ?? "nil")
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
    
    // 二分搜索树的中序遍历
    public func inOrder() {
        print("inOrder\n")

        inOrder(node: root)
    }
    // 中序遍历以node为根的二分搜索树, 递归算法
    private
    func inOrder(node:Node?) {
        //结束条件
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        print(node?.E ?? "nil")
        inOrder(node: node?.right)
        
    }
    
    // 二分搜索树的后序遍历
    public func postOrder() {
        print("postOrder\n")

        postOrder(node: root)
    }
    
    // 后序遍历以node为根的二分搜索树, 递归算法
    private
    func postOrder(node:Node?) {
        //结束条件
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        inOrder(node: node?.right)
        print(node?.E ?? "nil")
    }
    
    // 寻找二分搜索树的最小元素
    func minimum() -> Int {
        if count == 0 {
            return Int.min
        }
        
        return minimum(node: root).E
    }
    //查找最小数据 递归算法
    private
    func minimum(node:Node?) -> Node{
        if node?.left == nil {
            return node!
        }
        var minnode = node
        while minnode?.left != nil {
            minnode = minnode?.left
        }
        return minnode!
    }
    
    // 寻找二分搜索树的最大元素
    func maximum() -> Int {
        if count == 0 {
            return Int.max
        }
        return maximum(node: root).E
    }
    
    //查找最小数据 递归算法
    private
    func maximum(node:Node?) -> Node{
        var maxnode = node
        while maxnode?.right != nil {
            maxnode = maxnode?.right
        }
        return maxnode!
    }
    
    
    // 从二分搜索树中删除最小值所在节点, 返回最小值
    func removeMin() -> Int {
        if count == 0 {
            return Int.min
        }
        root = removeMin(node: root)
        return minimum()
    }
    
    // 删除掉以node为根的二分搜索树中的最小节点
    // 返回删除节点后新的二分搜索树的根
    private
    func removeMin(node:Node?) -> Node? {
        if node?.left == nil {
            count -= 1
            let rightNode = node?.right
            node?.right = nil
            return rightNode
        }
        node?.left = removeMin(node: node?.left)
        return node
    }
    
    func removeMax() -> Int {
        if count == 0 {
            return Int.max
        }
        root = removeMax(node: root)
        return maximum()
    }
    
    private func removeMax(node: Node?) -> Node? {
        if node?.right == nil {
            count -= 1
            let leftNode = node?.left
            node?.left = nil
            return leftNode
        }
        node?.right = removeMax(node: node?.right)
        return node!
    }
    
    
    // 删除为E的节点
    func remove(E:Int) ->Node{
        root = remove(E: E, node: root)
        return root!
    }
    
    // 删除掉以node为根的二分搜索树中值为e的节点, 递归算法
    // 返回删除节点后新的二分搜索树的根
    private
    func remove(E:Int,node:Node?) -> Node? {
        if node == nil {
            return nil
        }
        if E < (node?.E)! {
            node?.left = remove(E: E, node: node?.left)
            return node
        }else if E > (node?.E)! {
            node?.right = remove(E: E, node: node?.right)
            return node
        }else{
            //找到了
            // 待删除节点左子树为空的情况
            if node?.left == nil{
                let rightNode = node?.right
                node?.right = nil
                count -= 1
                return rightNode
            }
            // 待删除节点右子树为空的情况
            if node?.right == nil{
                let leftNode = node?.left
                node?.left = nil
                count -= 1
                return leftNode
            }
            // 待删除节点左右子树均不为空的情况
            
            // 找到比待删除节点大的最小节点, 即待删除节点右子树的最小节点
            // 用这个节点顶替待删除节点的位置
            let successor = minimum(node: node?.right)
            successor.right = removeMin(node: node?.right)
            successor.left = node?.left
            node?.right = nil
            node?.left = nil
            
            return successor
        }
    }
}


