//
//  MapView.swift
//  Vertical
//
//  Created by Matthew Alongi on 11/15/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44, longitude: -73.1964637),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
