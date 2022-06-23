//
//  CeluleTablă.swift
//  4_la_rând
//
//  Created by Kayden on 23.06.2022.
//

import Foundation
import UIKit

enum Celulă{
    case Rosu
    case Albastru
    case Gol
}

struct CelulăTablă
{
    var indexPath: IndexPath!
    var celulă: Celulă! // ! not optional
    
    func CelulăAlbastru() -> Bool
    {
        return celulă == Celulă.Albastru    }
    
    func CelulăRosu() -> Bool
    {
        return celulă == Celulă.Rosu
    }
    
    func CelulăGol() -> Bool
    {
        return celulă == Celulă.Gol
    }
    
    func culoareCelulă() -> UIColor
    {
        if CelulăAlbastru()
        {
            return .systemBlue
        }
        if CelulăRosu()
        {
            return .red
        }
        
        return .lightGray
    }
}
