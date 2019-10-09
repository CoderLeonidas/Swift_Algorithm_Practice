//
//  AppDelegate.swift
//  Swift_BST
//
//  Created by leon on 2019/10/10.
//  Copyright © 2019 Leonidas. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let tree = BST()
        tree.add(E: 100)
        tree.add(E: 1)
        tree.add(E: 2)
        tree.add(E: 3)
        tree.add(E: -1)
        tree.add(E: -11)
        tree.add(E: 101)
        tree.add(E: 102)
        tree.add(E: 103)

//        tree.preOrder()

//        var node = tree.remove(E: 100)
//        tree.inOrder()
        
        print(tree.maximum())
        print(tree.minimum())
        
        print(tree.contain(E: 101))
        print(tree.contain(E: 111))
        
        let max = tree.removeMax()
        print(max)

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

