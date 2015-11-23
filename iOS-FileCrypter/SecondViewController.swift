import UIKit

import Encryption
import File
import JLToast
class SecondViewController: UIViewController {

    let aes: AesManager = AesManager()
    let file: File = File()
    
    @IBOutlet weak var secretKeyTextField: UITextField!
    
    @IBOutlet weak var plainTextView: UITextView!
    @IBOutlet weak var cipherTextView: UITextView!
    @IBOutlet weak var decryptedTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secretKeyTextField.text = aes.getSecretKey()
        
        plainTextView.text = file.viewFileContent("plain_text")
        
        cipherTextView.text = ""
        decryptedTextView.text = ""
    }
    
    @IBAction func onSetKeyButtonPressed(sender: UIButton) {
        
        aes.setSecretKey(secretKeyTextField.text!)
        
        let newSecretKey = aes.getSecretKey()
        
        file.createFile("secret_key", contentsOfFile: newSecretKey)
        
        secretKeyTextField.text = newSecretKey
        
        JLToast.makeText("Secret key set!", delay: 1, duration: JLToastDelay.ShortDelay).show()
    }
    
    @IBAction func onSavePlainTextButtonPressed(sender: UIButton) {
        file.createFile("plain_text", contentsOfFile: plainTextView.text)
        JLToast.makeText("Plain text saved to file", delay: 1, duration: JLToastDelay.ShortDelay).show()
        
    }
    
    @IBAction func onEncryptButtonPressed(sender: UIButton) {
        
        let encryptedText = aes.aesEncrypt(file.viewFileContent("plain_text"))
        file.createFile("encrypted_text", contentsOfFile: encryptedText)
        cipherTextView.text = encryptedText
        
        JLToast.makeText("Text encrypted and saved to text file", delay: 1, duration: JLToastDelay.ShortDelay).show()
    }
    
    @IBAction func onDecryptButtonPressed(sender: UIButton) {
        
        let decryptedText = aes.aesDecrypt(file.viewFileContent("encrypted_text"))
        decryptedTextView.text = decryptedText
        
        JLToast.makeText("Text decrypted", delay: 1, duration: JLToastDelay.ShortDelay).show()
        
    }
    
    
    
    
}