//
//  AnatarView.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 28/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import SwiftUI

struct AnatarView: View {
    
    static let cache = NSCache<NSURL, UIImage>()
    
    /// imageUrl
    let urlString: String
    
    //Image Placeholder
    @State var initialImage = UIImage(named: "ImagePlaceholder") ?? UIImage()
    
    /// size
    let size: CGFloat
    
    /// body
    var body: some View {
        Image(uiImage: initialImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: self.size, height: self.size)
            .onAppear {
                guard let url = URL(string: self.urlString) else { return }
                
                if let image = AnatarView.cache.object(forKey: url as NSURL) {
                    self.initialImage = image
                } else {
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        guard let data = data else { return }
                        guard let image = UIImage(data: data) else { return }
                        AnatarView.cache.setObject(image, forKey: url as NSURL)
                        RunLoop.main.perform {
                            self.initialImage = image
                        }

                    }.resume()
                }
            }
    }
}

struct AnatarView_Previews: PreviewProvider {
    static var previews: some View {
        AnatarView(urlString: "", size: 50)
    }
}
