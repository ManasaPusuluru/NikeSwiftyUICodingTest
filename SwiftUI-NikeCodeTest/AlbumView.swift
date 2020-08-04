//
//  AlbumView.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 28/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import SwiftUI

struct AlbumView: View {
    /// post
    let record: Record
    
    /// body
    var body: some View {
        
        /// main stack
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 10) {
                    
                    // avatar
                    AnatarView(urlString: record.artworkUrl100 ?? "", size: 80)
                        .cornerRadius(5)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        // name
                        Text(record.name ?? "").font(.headline)
                        // post time
                        Text(record.artistName ?? "").font(.subheadline)
                    }
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
        }
        .padding(.top, 5)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(record: Record())
    }
}
