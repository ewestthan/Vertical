
import FirebaseFirestoreSwift

struct ClimbProfileViewModel: Identifiable, Codable {
    @DocumentID var id: String?
    var Name: String?
    var Grade: String?
    var Rating: Int?
    var Area: Int?
}
