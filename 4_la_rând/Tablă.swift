//
//  Tablă.swift
//  4_la_rând
//
//  Created by Kayden on 23.06.2022.
//

import Foundation
import UIKit

var tablă = [[CelulăTablă]]()

func ReseteazăTabla()
{
    tablă.removeAll()
    
    for rând in 0...5 // ia fiecare celulă
    {
        var rowArray = [CelulăTablă]()
        for coloană in 0...6
        {
            let indexPath = IndexPath.init(item: coloană, section: rând)
            let celulăTablă = CelulăTablă(indexPath: indexPath, celulă: Celulă.Gol)
            rowArray.append(celulăTablă)
        }
        tablă.append(rowArray)
    }
}

func ObțineCelulă(_ indexPath: IndexPath) -> CelulăTablă
{
    return tablă[indexPath.section][indexPath.item]
}

func UltimulRândPosibil(_ coloană: Int) -> CelulăTablă? // celula de jos pe o coloană
{
    for rând in (0...5).reversed()
    {
        let celulăTablă = tablă[rând][coloană]
        if celulăTablă.CelulăGol()
        {
            return celulăTablă
        }
    }
    
    return nil
}


func UpdateCeluleTablă(_ celulăTablă: CelulăTablă) // actualizează culoarea
{
    if let indexPath = celulăTablă.indexPath
    {
        tablă[indexPath.section][indexPath.item] = celulăTablă
    }
}

func TablăPlină() -> Bool
{
    for rând in tablă
    {
        for coloană in rând
        {
            if coloană.CelulăGol()
            {
                return false
            }
        }
    }
    
    return true
}

func Victorie()  -> Bool
{
    return VictorieOrizontală() || VictorieVerticală() || VictorieDiagonală()
}

func VictorieOrizontală()  -> Bool
{
    for rând in tablă
    {
        var legătură = 0
        for coloană in rând
        {
            if coloană.celulă == ObțineRândCurent()
            {
                legătură += 1
                if legătură >= 4
                {
                    return true
                }
            }
            else
            {
                legătură = 0
            }
        }
    }
    
    return false
}

func VictorieVerticală() -> Bool
{
    for coloană in 0...tablă.count
    {
        if VerificăVertical(coloană)
        {
            return true
        }
    }
    
    return false
}

func VerificăVertical(_ coloanăDeVerificat: Int) -> Bool
{
    var legătură = 0
    for rând in tablă
    {
        if rând[coloanăDeVerificat].celulă == ObțineRândCurent()
        {
            legătură += 1
            if legătură >= 4
            {
                return true
            }
        }
        else
        {
            legătură = 0
        }
    }
    return false
}

func VictorieDiagonală()  -> Bool
{
    for coloană in 0...tablă.count
    {
        if VerificăDiagonal(coloană, true, true)
        {
            return true
        }
        if VerificăDiagonal(coloană, true, false)
        {
            return true
        }
        if VerificăDiagonal(coloană, false, true)
        {
            return true
        }
        if VerificăDiagonal(coloană, false, false)
        {
            return true
        }
    }
    
    return false
}

func VerificăDiagonal(_ ColoanăDeVerificat: Int,_ moveUp: Bool,_ reverseRows: Bool) -> Bool
{
    var ColoanaUrm = ColoanăDeVerificat
    var legătură = 0
    if reverseRows
    {
        for rând in tablă.reversed()
        {
            if ColoanaUrm < rând.count && ColoanaUrm >= 0
            {
                if rând[ColoanaUrm].celulă == ObțineRândCurent()
                {
                    legătură += 1
                    if legătură >= 4
                    {
                        return true
                    }
                }
                else
                {
                    legătură = 0
                }
                ColoanaUrm = moveUp ? ColoanaUrm + 1 : ColoanaUrm - 1
            }
        }
    }
    else
    {
        for rând in tablă
        {
            if ColoanaUrm < rând.count && ColoanaUrm >= 0
            {
                if rând[ColoanaUrm].celulă == ObțineRândCurent()
                {
                    legătură += 1
                    if legătură >= 4
                    {
                        return true
                    }
                }
                else
                {
                    legătură = 0
                }
                ColoanaUrm = moveUp ? ColoanaUrm + 1 : ColoanaUrm - 1
            }
        }
    }
    
    return false
}
