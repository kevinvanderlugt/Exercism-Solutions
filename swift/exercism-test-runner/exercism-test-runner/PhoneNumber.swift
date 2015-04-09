import Foundation

private let invalidNumberResponse = "0000000000"

struct PhoneNumber {
    var startingNumber: String
    
    func number() -> String {
        return sanitizedPhoneNumber(startingNumber)
    }
    
    func areaCode() -> String {
        return sanitizedPhoneNumber(startingNumber)[0..<3]
    }
    
    func description() -> String {
        let phoneNumber = sanitizedPhoneNumber(startingNumber)
        return "(\(areaCode())) \(phoneNumber[3..<6])-\(phoneNumber[6..<10])"
    }
    
    private func sanitizedPhoneNumber(phoneNumber: String) -> String {
        let allowedCharacterSet = NSCharacterSet.decimalDigitCharacterSet()
        let components = phoneNumber.componentsSeparatedByCharactersInSet(allowedCharacterSet.invertedSet)
        let sanitizedNumber = join("", components)
        
        switch count(sanitizedNumber) {
        case 10: return sanitizedNumber
        case 11: return sanitizedNumber[0] == "1" ? dropFirst(sanitizedNumber) : invalidNumberResponse
        default: return invalidNumberResponse
        }
    }
}

//extension String {
//    subscript (i: Int) -> Character {
//        return self[advance(self.startIndex, i)]
//    }
//    subscript (r: Range<Int>) -> String {
//        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
//    }
//}