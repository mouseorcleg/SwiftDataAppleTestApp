/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The main entry for the app.
*/

import SwiftUI
import SwiftData

@main
struct SwiftDataFlashCardSample: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //when declared like this will be inherited for each view inside hierarchy
        .modelContainer(for: Card.self)
    }
}
