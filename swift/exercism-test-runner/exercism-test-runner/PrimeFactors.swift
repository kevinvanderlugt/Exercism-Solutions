struct PrimeFactors {
    static func For(number: Int) -> [Int] {
        var primeNumbers = [Int]()
        var index = 2, num = number
        while (num >= index)
        {
            if(num % index == 0){
                primeNumbers.append(index)
                if(num / index == 1) {
                    break
                }
                num = num / index
            } else {
                index++
            }
        }
        
        return primeNumbers
    }
}