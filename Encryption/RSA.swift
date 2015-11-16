import Heimdall
import File
public class RSA {

    private let file: File = File()
    private var heimdall = Heimdall(tagPrefix: "com.example")

    public func SaveKeysToFile(){
        if let publicKeyData = self.heimdall!.publicKeyDataX509(), privateKeyData = self.heimdall!.privateKeyDataX509() {

            let publicKeyString = publicKeyData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)

            let privateKeyString = privateKeyData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)

            file.createFile("private_key.txt", contentsOfFile: privateKeyString)
            file.createFile("public_key.txt", contentsOfFile: publicKeyString)

        }

    }

    public func EncryptFile(){

    }

    public func DecryptFile(){

    }

    public func SignFile(){

    }

    public func CheckSignature(){

    }

    public init(){
        print("Class initialized")
    }
}