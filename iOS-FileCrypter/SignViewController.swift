import UIKit

import JLToast

import Encryption
import File
class SignViewController: UIViewController {
    
    let file: File = File()
    let rsa: RsaManager = RsaManager()
    
    @IBOutlet weak var plainTextView: UITextView!
    @IBOutlet weak var hashTextView: UITextView!
    @IBOutlet weak var signatureTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plainTextView.text = file.viewFileContent("plain_text")
        
        hashTextView.text = ""
        signatureTextView.text = ""
        
    }
    
    
    @IBAction func onButtonPressed(sender: UIButton) {
        
        var message: String = ""
        
        if(sender.titleLabel!.text == "📝Save plain text")
        {
            file.createFile("plain_text", contentsOfFile: plainTextView.text)
            message = "Plain text saved"
        }
        else if(sender.titleLabel!.text == "✒️Sign")
        {
            let hash = rsa.shaEncode(file.viewFileContent("plain_text"))
            file.createFile("hash", contentsOfFile: hash)
            hashTextView.text = hash
            
            let signature = rsa.signMessage(file.viewFileContent("plain_text"))
            file.createFile("signature", contentsOfFile: signature)
            signatureTextView.text = signature
            
            message = "File signed!"
        }
        else if(sender.titleLabel!.text == "📝Save signature")
        {
            file.createFile("signature", contentsOfFile: signatureTextView.text)
            message = "Signature saved!"
        }
        else
        {
            let plaintext = file.viewFileContent("plain_text")
            let signature = file.viewFileContent("signature")
            message = (rsa.checkSignature(plaintext, signature: signature) ? "✅Signature valid" : "🚫Signature not valid")
        }
        
        JLToast.makeText(message, delay: 1, duration: JLToastDelay.ShortDelay).show()
    }
    
    
    
    
}

