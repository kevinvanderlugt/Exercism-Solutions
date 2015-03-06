class Anagram {
    var word: String
    
    init(word: String) {
        self.word = word
    }

    func match(words: [String]) -> [String] {
        let lowercaseWord = word.lowercaseString
        return words.filter {
            let anagram = $0.lowercaseString
            return anagram != lowercaseWord && (sorted(anagram) == sorted(lowercaseWord))
        }
    }
}