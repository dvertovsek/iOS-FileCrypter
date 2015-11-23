import UIKit

import JLToast

import Encryption
import File
class FirstViewController: UIViewController {
    
    let file: File = File()
    let rsa: RsaManager = RsaManager()
    
    @IBOutlet weak var publicKeyLabel: UILabel!
    @IBOutlet weak var privateKeyLabel: UILabel!
    
    @IBOutlet weak var plainTextView: UITextView!
    @IBOutlet weak var cipherTextView: UITextView!
    
    @IBOutlet weak var decryptedTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        publicKeyLabel.text = rsa.getPublicKey()
        privateKeyLabel.text = rsa.getPrivateKey()
        plainTextView.text = file.viewFileContent("plain_text")

        cipherTextView.text = ""
        decryptedTextView.text = ""
        
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
            let encryptedText = rsa.rsaEncrypt(file.viewFileContent("plain_text"))
            file.createFile("encrypted_text", contentsOfFile: encryptedText)
            cipherTextView.text = encryptedText
            message = "Text encrypted and saved to text file"
        }
        else
        {
            let decryptedText = rsa.rsaDecrypt(file.viewFileContent("encrypted_text"))
            decryptedTextView.text = decryptedText
            message = "Text decrypted!"
            
        }
        
        JLToast.makeText(message, delay: 1, duration: JLToastDelay.ShortDelay).show()
    }



    
}

