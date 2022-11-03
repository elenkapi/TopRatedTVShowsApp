//
//  MovieCell.swift
//  Elene_Kapanadze_22
//
//  Created by Ellen_Kapii on 13.08.22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var movieCellView: UIView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designCell()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //MARK: - private functions
          
          private func designCell() {
              
              
              movieCellView.backgroundColor = .init(red: 0.51, green: 0.255, blue: 0.255, alpha: 0.4)
              movieCellView.layer.borderWidth = 4
              movieCellView.layer.borderColor = .init(red: 0.135, green: 0.206, blue: 0.235, alpha: 0.9)
              movieCellView.layer.cornerRadius = 10
              
              
          }
       
    
}
