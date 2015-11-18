//
//  FirstViewController.swift
//  iOS-FileCrypter
//
//  Created by MTLab on 16/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import Encryption
import File
class FirstViewController: UIViewController {

    @IBOutlet weak var publicKeyLabel: UILabel!
    @IBOutlet weak var privateKeyLabel: UILabel!
    
    @IBOutlet weak var plainTextView: UITextView!
    
    let file: File = File()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rsa: RsaManager = RsaManager()
        publicKeyLabel.text = rsa.getPublicKey()
        privateKeyLabel.text = rsa.getPrivateKey()
        
//        plainTextView.text = "such sad to real"
//        print(file.viewFileContent("plain_text"))

    }

}

