//
//  DetailView.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 28/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var record: Record
    
    @ObservedObject var fetch = FetchDataList()
    
    @State var initialImage = UIImage(named: "ImagePlaceholder")
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(uiImage: initialImage ?? UIImage())
                        .resizable()
                        .aspectRatio(3/2, contentMode: .fit)
                        .onAppear {
                            guard let url = URL(string: self.record.artworkUrl100 ?? "") else { return }
                            URLSession.shared.dataTask(with: url) { (data, response, error) in
                                guard let data = data else { return }
                                guard let image = UIImage(data: data) else { return }
                                
                                RunLoop.main.perform {
                                    self.initialImage = image
                                }
                                
                            }.resume()
                    }
                    
                    Text(record.copyright ?? "").font(.subheadline).frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.blue)
                        .padding(.bottom, 10)
                        .padding(.trailing, 10)
                        .padding(.leading, 50)
                    
                }
                
                VStack {
                    // name
                    Text(record.name ?? "").font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                    // post time
                    Text(record.artistName ?? "").font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                    Text(record.releaseDate ?? "").font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
            }
            .navigationBarTitle(Text(record.name ?? ""), displayMode: .inline)
            
            VStack {
                Button(action: {
                    guard let url  = URL(string: "itms://itunes.apple.com/us/album/ne-olacak-dj-funky-c-vs-ogün-dalka-single/id1202943921".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }) {
                    Text("Album page in the iTunes store")
                        .padding(10.0)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                            
                    )
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(record: Record())
    }
}
