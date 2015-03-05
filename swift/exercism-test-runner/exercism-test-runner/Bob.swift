import Foundation

class Bob {
    class func hey(message: String) -> String {
        if(isEmpty(message)) {
            return "Fine, be that way."
        } else if isShouting(message) {
            return "Woah, chill out!"
        }else if(message.hasSuffix("?")) {
            return "Sure."
        }
        return "Whatever."
    }
    
    private class func isEmpty(input: String) -> Bool {
        let trimmedString = input.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        return trimmedString.isEmpty
    }
    
    private class func isShouting(input: String) -> Bool {
        return hasCharacters(input) && input.uppercaseString == input
    }
    
    private class func hasCharacters(input:String) -> Bool {
        let characterCount = input.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())
        return characterCount != nil
    }
}