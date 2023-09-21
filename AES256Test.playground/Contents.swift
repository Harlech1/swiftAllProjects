import UIKit
import Foundation
import CommonCrypto
        
/*
func decodeBase64String(_ base64String: String) {
    guard let data = Data(base64Encoded: base64String) else {
        print("Invalid Base64 string")
        return
    }

    if let decodedString = String(data: data, encoding: .utf8) {
        print("Decoded String: \(decodedString)")
    } else {
        print("Failed to decode the data to a string.")
    }
}

let base64String = "SGVsbG8gV29ybGQh" // Replace this with your Base64-encoded string
decodeBase64String(base64String)
*/

/*
// Replace this with your data in Data format
let dataToEncode = Data("Hello World!".utf8)

// Encode the data to a Base64 string
let base64String = dataToEncode.base64EncodedString()

print("Base64 Encoded String: \(base64String)")
 */

/*
if ( dataObj != nil ) {
    let encryptedDataText = dataObj!.base64EncodedString(options: NSData.Base64EncodingOptions())
    NSLog("Encrypted with pubkey: %@", encryptedDataText)
}
 */
/*
func encryptStringAES256(_ string: String, key: String) -> Data? {
    let keyData = key.data(using: .utf8)!
    let data = string.data(using: .utf8)!

    var encryptedData = Data(count: Int(data.count + kCCBlockSizeAES128))
    let encryptedLength = encryptedData.count

    let options: CCOptions = CCOptions(kCCOptionPKCS7Padding)

    var numBytesEncrypted: Int = 0

    let cryptStatus = keyData.withUnsafeBytes { keyBytes in
        data.withUnsafeBytes { dataBytes in
            encryptedData.withUnsafeMutableBytes { encryptedBytes in
                CCCrypt(
                    CCOperation(kCCEncrypt),
                    CCAlgorithm(kCCAlgorithmAES128),
                    options,
                    keyBytes.baseAddress, kCCKeySizeAES256,
                    nil,
                    dataBytes.baseAddress, data.count,
                    encryptedBytes.baseAddress, encryptedLength,
                    &numBytesEncrypted
                )
            }
        }
    }

    if UInt32(cryptStatus) == UInt32(kCCSuccess) {
        encryptedData.removeSubrange(numBytesEncrypted..<encryptedData.count)
        return encryptedData
    }

    return nil
}

let plaintextString = "Hello, World!"
let secretKey = "asdf1234ghjl5678"

if let encryptedData = encryptStringAES256(plaintextString, key: secretKey) {
    let encryptedString = encryptedData.base64EncodedString()
    print("Encrypted: \(encryptedString)")
} else {
    print("Encryption failed.")
}
*/
/*
func generateAES128KeyFromKeyString(_ keyString: String) -> Data? {
    let keyData = keyString.data(using: .utf8)!
    var hashData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))

    _ = hashData.withUnsafeMutableBytes { hashBytes in
        keyData.withUnsafeBytes { keyBytes in
            CC_SHA256(keyBytes.baseAddress, CC_LONG(keyData.count), hashBytes.bindMemory(to: UInt8.self).baseAddress)
        }
    }

    return hashData.subdata(in: 0..<16) // Take the first 16 bytes as the AES-128 key
}

// Usage example:
let keyString = "16CharKey1234567"
if let aes128Key = generateAES128KeyFromKeyString(keyString) {
    let plaintextString = "Hello, World!"
    if let encryptedData = encryptStringAES128(plaintextString, key: aes128Key) {
        let encryptedString = encryptedData.base64EncodedString()
        print("Encrypted: \(encryptedString)")
    } else {
        print("Encryption failed.")
    }
} else {
    print("Failed to generate AES-128 key from the key string.")
}
*/

func aesEncrypt(plainText: String, key: String) -> Data? {
    guard let keyData = key.data(using: .utf8), keyData.count == kCCKeySizeAES128 else {
        return nil
    }
    
    let inputData = plainText.data(using: .utf8)!
    let cryptDataLen = Int(inputData.count + kCCBlockSizeAES128)
    var cryptData = Data(count: cryptDataLen)
    
    let keyLength = size_t(kCCKeySizeAES128)
    
    let options = CCOptions(kCCOptionPKCS7Padding)
    
    var numBytesEncrypted: size_t = 0
    
    let cryptStatus = cryptData.withUnsafeMutableBytes { cryptBytes in
        inputData.withUnsafeBytes { dataBytes in
            keyData.withUnsafeBytes { keyBytes in
                CCCrypt(
                    CCOperation(kCCEncrypt),
                    CCAlgorithm(kCCAlgorithmAES),
                    options,
                    keyBytes.baseAddress, keyLength,
                    nil,
                    dataBytes.baseAddress, inputData.count,
                    cryptBytes.baseAddress, cryptDataLen,
                    &numBytesEncrypted
                )
            }
        }
    }
    
    if cryptStatus == kCCSuccess {
        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        return cryptData
    } else {
        return nil
    }
}
let plaintext = "Hello, world!"
let encryptionKey = "0123456789abcdef" // 16-byte (128-bit) key

if let encryptedData = aesEncrypt(plainText: plaintext, key: encryptionKey) {
    let encryptedString = encryptedData.base64EncodedString()
    print("Encrypted String: \(encryptedString)")
} else {
    print("Encryption failed.")
}







