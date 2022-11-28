//
//   MapView.swift
//  Vertical
//
//  Created by Matthew Alongi on 11/15/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.4778528, longitude: -73.1964637),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: 44.4778528,
            longitude: -73.1964637)
    }
}

struct PinAnnotationMapView: View {
    let place: IdentifiablePlace
    @State var region: MKCoordinateRegion

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [place])
        { place in
            MapMarker(coordinate: place.location,
                   tint: Color.purple)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
