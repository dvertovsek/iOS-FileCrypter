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
    
    let file: File = File()
    
    @IBOutlet weak var publicKeyLabel: UILabel!
    @IBOutlet weak var privateKeyLabel: UILabel!
    @IBOutlet weak var plainTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rsa: RsaManager = RsaManager()
        publicKeyLabel.text = rsa.getPublicKey()
        privateKeyLabel.text = rsa.getPrivateKey()
        plainTextView.text = file.viewFileContent("plain_text")

    }
    
    
    @IBAction func onButtonPressed(sender: UIButton) {
        
        print("necu izdat ja")
    }



    
}

