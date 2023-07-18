/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The main view that contains the majority of the app's content.
*/

import SwiftUI
import SwiftData

struct ContentView: View {
    //Provides view with data + updates said data automatically if something changes
    @Query private var cards: [Card]
    @State private var editing = false
    @State private var navigationPath: [Card] = []
    //needed to save and update the cards
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack(path: $navigationPath) {
            CardGallery(cards: cards, editing: $editing) { card in
                withAnimation { navigationPath.append(card) }
            } addCard: {
                let newCardModel = Card(front: "Sample Front", back: "Sample Back")
                // save card
                modelContext.insert(newCardModel)
                //no need to call modelContext save here
                //autosave is triggered by UI changes and user imput
                withAnimation {
                    navigationPath.append(newCardModel)
                    editing = true
                }
            }
            .padding()
            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 500, minHeight: 500)
        .modelContainer(previewContainer)
}
