import Foundation

struct DNA {
    private var strand: String
    var nucleotideCounts: [String: Int] {
        var nucleotides = ["A": 0,"T": 0,"C" : 0,"G" : 0 ]
        
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
        let validCharacters = NSCharacterSet(charactersInString: "ACTG")
        return nil == strand.uppercaseString.rangeOfCharacterFromSet(validCharacters.invertedSet)
    }
    
    func count(matchingStrand: String) -> Int? {
        return nucleotideCounts[matchingStrand]
    }
}