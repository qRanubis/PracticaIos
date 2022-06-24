//
//  ViewController.swift
//  TicTacToe
//
//  Created by CallumHill on 30/7/21.
//

import UIKit

class ViewController: UIViewController
{
    enum Rând {
        case Zero
        case X
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var AlegePrimu = Rând.X
    var AlegeAcum = Rând.X
    
    let zero = "🐱"
    let x = "🐶"
    var board = [UIButton]()
    
    var ScorZero = 0
    var ScorX = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard()
    {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton)
    {
        AdaugăPeTablă(sender)
        
        if Victorie(x)
        {
            ScorX += 1
            Rezultat(title: "🐶 Câștigă !")
        }
        
        if Victorie(zero)
        {
            ScorZero += 1
            Rezultat(title: "🐱 Câștigă !")
        }
        
        if(TablăPlină())
        {
            Rezultat(title: "Egal !")
        }
    }
    
    func Victorie(_ s :String) -> Bool
    {
        if Simbol(a1, s) && Simbol(a2, s) && Simbol(a3, s)
        {
            return true
        }
        if Simbol(b1, s) && Simbol(b2, s) && Simbol(b3, s)
        {
            return true
        }
        if Simbol(c1, s) && Simbol(c2, s) && Simbol(c3, s)
        {
            return true
        }
        
        if Simbol(a1, s) && Simbol(b1, s) && Simbol(c1, s)
        {
            return true
        }
        if Simbol(a2, s) && Simbol(b2, s) && Simbol(c2, s)
        {
            return true
        }
        if Simbol(a3, s) && Simbol(b3, s) && Simbol(c3, s)
        {
            return true
        }
        
        if Simbol(a1, s) && Simbol(b2, s) && Simbol(c3, s)
        {
            return true
        }
        if Simbol(a3, s) && Simbol(b2, s) && Simbol(c1, s)
        {
            return true
        }
        
        return false
    }
    
    func Simbol(_ button: UIButton, _ simbol: String) -> Bool
    {
        return button.title(for: .normal) == simbol
    }
    
    func Rezultat(title: String)
    {
        let message = "\nPisică: " + String(ScorZero) + "\n\nCâine: " + String(ScorX)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Din nou", style: .default, handler: { (_) in
            self.ReseteazăTabla()
        }))
        self.present(ac, animated: true)
    }
    
    func ReseteazăTabla()
    {
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true // reactivează celulele
        }
        if AlegePrimu == Rând.Zero
        {
            AlegePrimu = Rând.X
            turnLabel.text = x // AlegeAcum.text = x
        }
        else if AlegePrimu == Rând.X
        {
            AlegePrimu = Rând.Zero
            turnLabel.text = zero // AlegeAcum.text = zero
        }
        AlegeAcum = AlegePrimu
    }
    
    func TablăPlină() -> Bool // verificăm dacă avem celulă goală
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    func AdaugăPeTablă(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(AlegeAcum == Rând.Zero)
            {
                sender.setTitle(zero, for: .normal)
                AlegeAcum = Rând.X
                turnLabel.text = x // acumAlege.text = x
            }
            else if(AlegeAcum == Rând.X)
            {
                sender.setTitle(x, for: .normal)
                AlegeAcum = Rând.Zero
                turnLabel.text = zero // acumAlege.text = zero
            }
            sender.isEnabled = false // elimină animația de a apasă pe aceeași celulă
        }
    }
    
}

