//
//  ServicesCollectionViewCellController.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit

final class ServicesCollectionViewCellController: AbstractCollectionViewCellController {
    
    override init() {
        super.init()
        sectionItems = [
            Service(title: "Flight Ticket", imagePath: Constants.ImageNames.flightTicketImage, price: 300),
            Service(title: "Train Ticket", imagePath: Constants.ImageNames.trainTicketImage, price: 75),
            Service(title: "Bus Ticket", imagePath: Constants.ImageNames.busTicketImage, price: 20),
            Service(title: "Cinema Ticket", imagePath: Constants.ImageNames.cinemaTicket, price: 15),
            Service(title: "Restaurant Booking", imagePath: Constants.ImageNames.restaurantBooking, price: 50),
            Service(title: "Hotel Booking", imagePath: Constants.ImageNames.hotelBooking, price: 150),
        ]
    }
    
    override class func registerCell(on collectionView: UICollectionView) {
        collectionView.register(ServiceCollectionViewCell.self,
                                forCellWithReuseIdentifier: ServiceCollectionViewCell.reusableIdentifier)
    }
    
    override func cellForItem(in collectionView: UICollectionView,
                              atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let servicesCell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.reusableIdentifier,
                                                                    for: indexPath) as? ServiceCollectionViewCell,
              let service = sectionItems[indexPath.item] as? Service else { return UICollectionViewCell () }
        
        servicesCell.configure(with: service)
        
        return servicesCell
                
    }
    
    override func didSelectCell(in collectionView: UICollectionView,
                                atIndexPath indexPath: IndexPath) {
        guard let selectedService = sectionItems[indexPath.item] as? Service else { return }
        let event = ServiceCellEvent(service: selectedService)
        cellEventHandler?.eventDidHappen(event, sender: self)
    }
}
