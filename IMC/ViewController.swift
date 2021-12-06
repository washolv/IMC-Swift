//
//  ViewController.swift
//  IMC
//
//  Created by Francisco Washington de Almeida Oliveira on 05/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var imResult: UIImageView!
    @IBOutlet weak var lbResult: UILabel!
    var imc: Double = 0;
    @IBOutlet weak var viResult: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / pow(height,2);
            showResults();
        }
            
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
    func showResults(){
        var result: String="";
        var image: String="";
        switch imc{
            case 0..<16:
                result = "Magreza";
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso";
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal";
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso";
                image = "sobre"
            default:
                result="obesidade";
                image="obesidade";
        }
        lbResult.text="\(Int(imc)): \(result)"
        imResult.image=UIImage(named: image);
        viResult.isHidden=false;
        view.endEditing(true);
    }

}

