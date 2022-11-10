
import FirebaseFirestoreSwift

struct ClimbProfileModel: Identifiable, Codable {
    @DocumentID var id: String?
    var Name: String?
    var Grade: String?
    var Rating: Int?
}
