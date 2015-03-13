enum NumberClassification {
    case Perfect, Deficient, Abundent
}

struct NumberClassifier {
    var number: Int
    
    var classification: NumberClassification {
        let sum = aliquotSum(number)
        if(number == sum) {
            return .Perfect
        } else if (sum < number) {
            return .Deficient
        } else {
            return .Abundent
        }
    }
    
    private func aliquotSum(number: Int) -> Int {
        var aliquotSum = 0
        for i in 1..<number {
            if(number % i == 0) { aliquotSum += i }
        }
        return aliquotSum
    }
}