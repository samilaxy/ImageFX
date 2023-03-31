//
//  ImageView.swift
//  Caching
//
//  Created by Noye Samuel on 29/03/2023.
//

import SwiftUI
import Combine

    struct ImageView: View {
    
        @StateObject var imageLoader: ImageLoaderVM
        
        init(imageUrl: String, key: String) {
            _imageLoader = StateObject(wrappedValue: ImageLoaderVM(url: URL(string: imageUrl)!, key: key))
        }
        
        var body: some View {
            VStack {
                if imageLoader.isLoading {
                    ProgressView()
                } else {
                    Image(uiImage: imageLoader.image ?? UIImage(systemName: "photo")!)
                        .resizable()
                 }
            }
            .frame(height: 200)
            .padding(.all, 4)
        }
    }
    
    struct ImageDetailView: View {
        @StateObject var imageLoader: ImageLoaderVM
        
        init(imageUrl: String, key: String) {
            _imageLoader = StateObject(wrappedValue: ImageLoaderVM(url: URL(string: imageUrl)!, key: key))
        }
        
        var body: some View {
            VStack {
                Spacer()
            Image(uiImage: imageLoader.image ?? UIImage(systemName: "photo")!)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(height: 400)
                .padding()
                Spacer()
                }
        }
    }
