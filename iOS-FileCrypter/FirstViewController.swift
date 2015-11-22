//
//  FirstViewController.swift
//  iOS-FileCrypter
//
//  Created by MTLab on 16/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit

import JLToast

import Encryption
import File
class FirstViewController: UIViewController {
    
    let file: File = File()
    
    @IBOutlet weak var publicKeyLabel: UILabel!
    @IBOutlet weak var privateKeyLabel: UILabel!
    
    @IBOutlet weak var plainTextView: UITextView!
    @IBOutlet weak var cipherTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let rsa: RsaManager = RsaManager()
//        publicKeyLabel.text = rsa.getPublicKey()
//        privateKeyLabel.text = rsa.getPrivateKey()
//        plainTextView.text = file.viewFileContent("plain_text")

    }
    
    
    @IBAction func onButtonPressed(sender: UIButton) {
        
        var message: String = ""
        if(sender.titleLabel!.text == "📝Save plain text")
        {
            file.createFile("plain_text", contentsOfFile: plainTextView.text)
            message = "Plain text saved"
        }
        else if(sender.titleLabel!.text == "🔐Encrypt plain text")
        {
            message = "Text encrypted and saved to text file"
        }
        
        JLToast.makeText(message, delay: 1, duration: JLToastDelay.ShortDelay).show()
    }



    
}

