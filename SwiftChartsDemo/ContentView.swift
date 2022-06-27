//
//  ContentView.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                OldChartsView()
            } label: {
                Text("Old Way")
            }

            NavigationLink(destination: {
                NewChartsView()
            }, label: {
                Text("New Way")
            })
            .navigationTitle("Charts weight/time")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
