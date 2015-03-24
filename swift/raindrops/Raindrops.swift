struct Raindrops {
    static func convert(number: Int) -> String {
        let responses = sorted([ 3: "Pling", 5: "Plang", 7: "Plong" ], { $0.0 < $1.0 } )
        
        let response = responses.reduce("") { response, pair in
            return response + (number % pair.0 == 0 ? pair.1 : "")
        }
        return response != "" ? response : "\(number)"
    }
}