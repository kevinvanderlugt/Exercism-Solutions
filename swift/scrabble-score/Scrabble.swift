struct Scrabble {
    var word: String
    var score: Int { return Scrabble.score(word) }
    
    init(_ word: String?) {
        self.word = word ?? ""
    }
    
    static func score(word: String) -> Int {
        return reduce(word.uppercaseString, 0, { $0 + self.letterScore($1) })
    }
    
    static func letterScore(letter: Character) -> Int {
        switch letter {
            case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T": return 1
            case "D", "G": return 2
            case "B", "C", "M", "P": return 3
            case "F", "H", "V", "W", "Y": return 4
            case "K": return 5
            case "J", "X": return 8
            case "Q", "Z": return 10
            default: return 0
        }
    }
}