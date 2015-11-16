import Foundation

public class File {
    
    let documentsUrl: NSURL
    
    public init ()
    {
        self.documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    }
    
    public func createFile(fileName: String, contentsOfFile: String) {
        //let urlString = fileUrl.absoluteString
        //print("the url = \(urlString)")
        
        let fileUrl = self.documentsUrl.URLByAppendingPathComponent(fileName)
        
        try! contentsOfFile.writeToURL(fileUrl, atomically: true, encoding: NSUTF8StringEncoding)
    }
    
    public func viewFileContent(fileName: String) -> String {
        
        let fileUrl = self.documentsUrl.URLByAppendingPathComponent(fileName)
        var mytext = ""
        
        do {
            mytext = try String(contentsOfURL: fileUrl, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print("error loading from url \(fileUrl)")
            print(error.localizedDescription)
        }
        return mytext
    }
    
}