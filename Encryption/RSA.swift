import Heimdall
import File
public class RsaManager {

    private let file: File = File()
    private var heimdall = Heimdall(tagPrefix: "com.example")

    private var publicKey = ""
    private var privateKey = ""
    
    public init (){
        
        if let publicKeyData = self.heimdall!.publicKeyDataX509(), privateKeyData = self.heimdall!.privateKeyDataX509() {

            let publicKeyString = publicKeyData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)

            let privateKeyString = privateKeyData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)

            file.createFile("private_key", contentsOfFile: privateKeyString)
            file.createFile("public_key", contentsOfFile: publicKeyString)
        }
    }
    
    public func rsaEncrypt(message: String)->String{
        
        let encryptedString = heimdall?.encrypt(message)
        return encryptedString!
    }

    public func rsaDecrypt(encryptedString: String)->String{
        
        let decryptedString = heimdall?.decrypt(encryptedString)
        return decryptedString!
    }

    public func signMessage(message: String)->String{
        
        let signedString = heimdall?.sign(message)
        return signedString!
    }

    public func checkSignature(message: String, signature: String)->Bool{
        
        let signatureValid = heimdall?.verify(message, signatureBase64: signature)
        return signatureValid!
    }
}