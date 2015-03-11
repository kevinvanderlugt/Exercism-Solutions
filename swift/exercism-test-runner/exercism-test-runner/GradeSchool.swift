import Foundation

class GradeSchool {
    var db = [Int: [String]]()
    
    func addStudent(name: String, grade: Int) {
        var students = studentsInGrade(grade)
        students.append(name)
        db[grade] = students
    }
    
    func studentsInGrade(grade: Int) -> [String] {
        return db[grade] ?? []
    }
    
    func sortedRoster() -> [Int: [String]] {
        var sortedDb = db
        for (grade, students) in sortedDb {
            sortedDb[grade] = students.sorted { $0 < $1 }
        }
        return sortedDb
    }
}
