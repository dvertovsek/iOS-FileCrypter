//
//  AES.swift
//  iOS-FileCrypter
//
//  Created by MTLab on 16/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation

import CryptoSwift
import File

public class AesManager
{
    private var file: File = File()
    private var secretKey: String = ""
    
    private var iv: String = ""
    
    public init()
    {
        self.iv = randomStringWithLength(16)
        self.secretKey = randomStringWithLength(32)
        
        file.createFile("secret_key", contentsOfFile: self.secretKey)
    }
    
    
    public func aesEncrypt(message: String)->String
    {
        let data = message.dataUsingEncoding(NSUTF8StringEncoding)
        let enc = try! AES(key: self.secretKey, iv: iv, blockMode:.CBC).encrypt(data!.arrayOfBytes())
        let encData = NSData(bytes: enc, length: Int(enc.count))
        let base64String: String = encData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0));
        let result = String(base64String)
        return result
    }
    
    public func aesDecrypt(encmessage: String)->String
    {
        let data = NSData(base64EncodedString: encmessage, options: NSDataBase64DecodingOptions(rawValue: 0))
        let dec = try! AES(key: self.secretKey, iv: iv, blockMode:.CBC).decrypt(data!.arrayOfBytes())
        let decData = NSData(bytes: dec, length: Int(dec.count))
        if let result = NSString(data: decData, encoding: NSUTF8StringEncoding)
        {
            return String(result)
        }
        else
        {
            return "..."
        }

    }
    
    public func getSecretKey()->String
    {
        return self.secretKey
    }
    
    public func setSecretKey(var key: String)
    {
        let noOfCharacters = key.characters.count
        if(noOfCharacters < 32)
        {
            key += randomStringWithLength(32 - key.characters.count)
        }
        else if (noOfCharacters > 32)
        {
            key = key.substringWithRange(Range<String.Index>(start: key.startIndex, end: key.startIndex.advancedBy(32)))
        }
        self.secretKey = key
        
        SaveKeyToFile(key)
    }
    
    private func SaveKeyToFile(key: String) -> Void
    {
        file.createFile("secret_key", contentsOfFile: key)
    }
    
    private func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/+*=)(#$%&?"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString as String
    }
}