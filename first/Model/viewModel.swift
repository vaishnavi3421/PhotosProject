//
//  viewModel.swift
//  first
//
//  Created by Sanjay, Vaishnavi on 28/02/23.
//

import Foundation

class photoViewModel{
    var photo:[Photos] = []
    func fetchPhotos(completed : @escaping()-> ()) {
        
        APIService.shared.fetch { photos in
            self.photo = photos
            completed()
        }
    }
}
