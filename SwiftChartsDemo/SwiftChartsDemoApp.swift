//
//  SwiftChartsDemoApp.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import SwiftUI

@main
struct SwiftChartsDemoApp: App {
    let dataSource = DataSource()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataSource)
        }
    }
}
