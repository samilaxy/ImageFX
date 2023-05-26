//
//  ViewModel.swift
//  Caching
//
//  Created by Noye Samuel on 29/03/2023.
//

import Foundation
import Combine
import UIKit

class ViewModel: ObservableObject {
    
    @Published var images: [UnsplashImage] = []
    @Published var isLoading = true
    var networkManager = NetworkManager()
    
    init(dataService: NetworkManager) {
        self.networkManager = dataService
        self.getImages()
    }
    
    var cancellables = Set<AnyCancellable>()
    
    func getImages() {
        self.isLoading = true
        guard images.isEmpty else { return }
        networkManager.getImages()
            .sink { _ in
                self.isLoading = false
            }  receiveValue: { [weak self] returnedimages in
                self?.images = returnedimages
            }
            .store(in: &cancellables)
        print("request:::", images)
    }
}