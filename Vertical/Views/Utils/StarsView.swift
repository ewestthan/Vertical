import SwiftUI

struct StarsView: View {
    var rating: Int;
    var maxRating: Int = 5;

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = CGFloat(rating) / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}
