import Foundation

struct WordCount {
    private let words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> [String: Int] {
        let components = sanitizedComponents(words.lowercaseString)
        
        var wordCount = [String: Int]()
        for word in components {
            wordCount[word] = (wordCount[word] ?? 0) + 1
        }
        return wordCount
    }
    
    private func sanitizedComponents(words: String) -> [String] {
        let allowedCharacterSet = NSCharacterSet.alphanumericCharacterSet()
        let components = words.componentsSeparatedByCharactersInSet(allowedCharacterSet.invertedSet)
    
        return components.filter { $0 != "" }
    }
}