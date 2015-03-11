import Foundation

class GradeSchool {
    private(set) var db = [Int: [String]]()
    
    func addStudent(name: String, grade: Int) {
        db[grade] = studentsInGrade(grade) + [name]
    }
    
    func studentsInGrade(grade: Int) -> [String] {
        return db[grade] ?? []
    }
    
    func sortedRoster() -> [Int: [String]] {
        var sortedDb = db
        for (grade, students) in sortedDb {
            sortedDb[grade] = sorted(students)
        }
        return sortedDb
    }
}
