//
//  HomeWidget.swift
//  HomeWidget
//
//  Created by Ginder Singh on 2022-10-08.
//

import WidgetKit
import SwiftUI

@main
struct HomeWidget: Widget {
    // Body of the widget
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "io.ginder", intent: CustomWidgetConfigurationIntent.self, provider: HomeWidgetProvider()) { entry in
            HomeView(text: entry.text)
        }.configurationDisplayName("Lock Widget")
            .description("Shows last recorded text.")
            .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline, .systemSmall, .systemMedium])
    }
}

struct HomeWidgetProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> HomeEntry {
        HomeEntry(date: Date(), text: "No value yet")
    }
    
    func getSnapshot(for configuration: CustomWidgetConfigurationIntent, in context: Context, completion: @escaping (HomeEntry) -> ()) {
        let entry = HomeEntry(date: Date(), text: "Last recorded text")
        completion(entry)
    }
    
    // This gets called every 5 minutes or when realod called from host app
    func getTimeline(for configuration: CustomWidgetConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let userDefaults = UserDefaults(suiteName: "group.io.ginder")
        guard let lastSavedItem = userDefaults?.value(forKey: "saved_item") as? String else {
            return
        }
        let calendar = Calendar.current
        let whenToUpdate = calendar.date(byAdding: .minute, value: 5, to: Date.now) ?? Date.now
        let entry = HomeEntry(date: Date.now, text: lastSavedItem)
        let timeline = Timeline(entries:[entry],policy: .after(whenToUpdate))
        completion(timeline)
    }
}

// Store What goes in to widget
struct HomeEntry : TimelineEntry {
    var date: Date
    var text: String
}

// UI of the widget
struct HomeView: View {
    var text = ""
    init(text: String){
        self.text = text
    }
    var body: some View {
        return Text(text)
    }
}
