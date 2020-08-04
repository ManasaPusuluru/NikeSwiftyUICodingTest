//
//  ContentView.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 28/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = FetchDataList()
    
    var body: some View {
        NavigationView {
            VStack {
                //Albums list View
                List(fetch.list) { record in
                    NavigationLink(destination: DetailView(record: record)) {
                        AlbumView(record: record)
                    }
                }
                .padding(.leading, -20)
                .padding(.trailing, -20)
                .navigationBarTitle(Text("Albums"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
