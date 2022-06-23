//
//  Turn.swift
//  ConnectFourTutorial
//
//  Created by CallumHill on 20/11/21.
//

import Foundation
import UIKit

enum Rând
{
    case Rosu
    case Albastru
}

var AlegeAcum = Rând.Albastru

func ComutareJucător(_ ImagineJucător: UIImageView) // schimbă rândul jucătorului
{
    if AlegeAlbastru()
    {
        AlegeAcum = Rând.Rosu
        ImagineJucător.tintColor = .red
    }
    else
    {
        AlegeAcum = Rând.Albastru
        ImagineJucător.tintColor = .systemBlue
    }
}

func AlegeAlbastru() -> Bool
{
    return AlegeAcum == Rând.Albastru
}

func AlegeRosu() -> Bool
{
    return AlegeAcum == Rând.Rosu
}

func ObțineRândCurent() -> Celulă // returnează culoarea jucătorului care este la rând
{
    return AlegeAlbastru() ? Celulă.Albastru : Celulă.Rosu
}

func ObțineCuloareCelulă() -> UIColor
{
    return AlegeAlbastru() ? .systemBlue : .red
}

func MesajVictorie() -> String
{
    return AlegeAlbastru() ? "Albastru câștigă !" : "Rosu câștigă !"
}
