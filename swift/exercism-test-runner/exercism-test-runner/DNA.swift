import Foundation

struct DNA {
    private let allNucleotides = ["A", "T", "C", "G"]
    
    private var strand: String
    var nucleotideCounts: [String: Int] {
        var nucleotides = [String: Int]()
        allNucleotides.map { nucleotides[$0] = 0 }
        
        for (index, nucleotide) in enumerate(strand) {
            let nucleotideString = String(nucleotide)
            nucleotides[nucleotideString] = (nucleotides[nucleotideString] ?? 0) + 1
        }
        
        return nucleotides
    }
    
    static func withStrand(strand: String) -> DNA? {
        return DNA(strand: strand)
    }
    
    init?(strand: String) {
        self.strand = strand
        
        if(!validStrand(strand)) {
            return nil
        }
    }
    
    func validStrand(strand: String) -> Bool {
        let validCharacters = NSCharacterSet(charactersInString: join("", allNucleotides))
        return nil == strand.uppercaseString.rangeOfCharacterFromSet(validCharacters.invertedSet)
    }
    
    func count(matchingStrand: String) -> Int? {
        return nucleotideCounts[matchingStrand]
    }
}