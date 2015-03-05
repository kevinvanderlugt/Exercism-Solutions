import Foundation

struct ETL {
    static func transform(input: [Int: [String]]) -> [String: Int] {
        var transform = [String: Int]()
        for (point, letters) in input {
            letters.map { transform[$0.lowercaseString] = point }
        }
        return transform
    }
}