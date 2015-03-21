struct Triangle {
    private(set) var kind = "ErrorKind"
    
    init(_ a: Double,_ b: Double,_ c: Double) {
        if(isValid([a, b, c])) {
            if a == b && a == c {
                kind = "Equilateral"
            } else if (a == b || b == c || a == c) {
                kind = "Isosceles"
            } else {
                kind = "Scalene"
            }
        }
    }
    
    private func isValid(sides: [Double]) -> Bool {
        if(countElements(sides.filter{$0 <= 0}) == 0){
            let sortedSides = sorted(sides)
            if(sortedSides[0] + sortedSides[1] > sortedSides[2]) {
                return true
            }
        }
        return false
    }
}