//
//  FirstViewController.swift
//  iOS-FileCrypter
//
//  Created by MTLab on 16/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import Encryption
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var a = AESCrypt()
        
        var key = a.SaveKeyToFile()
        key = "qwertyuioplkjhgfdsazxcvbnmjhgfds"
        var key2 = "qwertyuiopDDjhgfdsazxcvbnmjhgfds"

        var iv = "1234567890987654"
        
        var message = "plist"
                print(message)
        var sss = try! message.aesEncrypt(key, iv: iv)
                print(sss)
        var fdd = try! sss.aesDecrypt(key2, iv: iv)


        print(fdd)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

