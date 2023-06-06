//
//  extentionChangePasswordViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 12/09/2023.
//

import UIKit

extension ChangePasswordViewController : UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if currentPasswordTxt.text!.isEmpty {
            currentPasswordView.backgroundColor = .white
            descriptionCurrentPasswordLbl.isHidden = true
        } else if currentPasswordTxt.text!.count >= 0 && currentPasswordTxt.text!.count < 6 {
            descriptionCurrentPasswordLbl.isHidden = false
            currentPasswordView.backgroundColor = .red
            descriptionCurrentPasswordLbl.textColor = .red
            descriptionCurrentPasswordLbl.text =  self.holdUp6Character
        }
     
        if newPasswordTxt.text!.isEmpty {
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            newPasswordView.backgroundColor = .white
            
        }else if newPasswordTxt.text!.count == 0  {
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            newPasswordView.backgroundColor = .white
        }
        else if newPasswordTxt.text!.count > 0 && newPasswordTxt.text!.count < 2 {
            
            weakView.backgroundColor = .orange
            averageView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text =  self.holdUp
            descriptionPasswordlbl.textColor = .orange
            
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Weak".localized
            strongPasswordLbl.textColor = .orange
            newPasswordView.backgroundColor = .orange
            
        } else if newPasswordTxt.text!.count >= 2 && newPasswordTxt.text!.count <= 3 {
            
            weakView.backgroundColor = .green
            averageView.backgroundColor = .green
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text = self.holdUp
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Average".localized
            strongPasswordLbl.textColor = .green
            newPasswordView.backgroundColor = .green
            
        }else if newPasswordTxt.text!.count > 3 && newPasswordTxt.text!.count <= 5 {
            
            weakView.backgroundColor = .yellow
            averageView.backgroundColor = .yellow
            goodView.backgroundColor = .yellow
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Good".localized
            strongPasswordLbl.textColor = .yellow
            newPasswordView.backgroundColor = .yellow
            
        }  else if newPasswordTxt.text!.count > 5 {
            
            weakView.backgroundColor = .red
            averageView.backgroundColor = .red
            goodView.backgroundColor = .red
            StrongView.backgroundColor = .red
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Strong".localized
            strongPasswordLbl.textColor = .red
            newPasswordView.backgroundColor = .red
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if currentPasswordTxt.text!.isEmpty{
            currentPasswordView.backgroundColor = .white
            descriptionCurrentPasswordLbl.isHidden = true
        }
        else if currentPasswordTxt.text!.count >= 0 && currentPasswordTxt.text!.count <= 5 {
            descriptionCurrentPasswordLbl.isHidden = false
            currentPasswordView.backgroundColor = .red
            descriptionCurrentPasswordLbl.textColor = .red
            descriptionCurrentPasswordLbl.text = self.holdUp6Character
        }  else if currentPasswordTxt.text!.count >= 6 {
            descriptionCurrentPasswordLbl.isHidden = true
            currentPasswordView.backgroundColor = .white
        }
        
        // new Password
        if newPasswordTxt.text!.isEmpty{
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            newPasswordView.backgroundColor = .white
            
        } else if newPasswordTxt.text!.count == 0  {
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            newPasswordView.backgroundColor = .white
        }
        else if newPasswordTxt.text!.count > 0 && newPasswordTxt.text!.count < 2 {
            
            weakView.backgroundColor = .orange
            StrongView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text = self.holdUp
            descriptionPasswordlbl.textColor = .orange
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Weak".localized
            strongPasswordLbl.textColor = .orange
            newPasswordView.backgroundColor = .orange
            
        } else if newPasswordTxt.text!.count >= 2 && newPasswordTxt.text!.count <= 3 {
            
            weakView.backgroundColor = .green
            StrongView.backgroundColor = .green
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text = self.holdUp
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Average".localized
            strongPasswordLbl.textColor = .green
            newPasswordView.backgroundColor = .green
            
        }else if newPasswordTxt.text!.count > 3 && newPasswordTxt.text!.count <= 5 {
            
            weakView.backgroundColor = .yellow
            StrongView.backgroundColor = .yellow
            goodView.backgroundColor = .yellow
            averageView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Good".localized
            strongPasswordLbl.textColor = .yellow
            newPasswordView.backgroundColor = .yellow
            
        }  else if newPasswordTxt.text!.count > 5 {
            
            weakView.backgroundColor = .red
            StrongView.backgroundColor = .red
            goodView.backgroundColor = .red
            averageView.backgroundColor = .red
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Strong".localized
            strongPasswordLbl.textColor = .red
            newPasswordView.backgroundColor = .red
        }
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textField == newPasswordTxt) {
            newPasswordTxt.becomeFirstResponder()
            
            if newPasswordTxt.text!.isEmpty{
                strongPasswordLbl.isHidden = true
                descriptionPasswordlbl.isHidden = true
                newPasswordView.backgroundColor = .white
                
                
                weakView.backgroundColor = .clear
                averageView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                newPasswordView.backgroundColor = .white
                return true
           
                
            }else if newPasswordTxt.text!.count == 0  {
                strongPasswordLbl.isHidden = true
                descriptionPasswordlbl.isHidden = true
                newPasswordView.backgroundColor = .white
                
                weakView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                averageView.backgroundColor = .clear
                
                newPasswordView.backgroundColor = .white
            }
            else if newPasswordTxt.text!.count > 0 && newPasswordTxt.text!.count < 2 {
                weakView.backgroundColor = .orange
                averageView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = false
                descriptionPasswordlbl.text = self.holdUp
                descriptionPasswordlbl.textColor = .orange
                
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Weak".localized
                strongPasswordLbl.textColor = .orange
                newPasswordView.backgroundColor = .orange
                return true
                
                
            }else if newPasswordTxt.text!.count >= 2 && newPasswordTxt.text!.count <= 3 {
                
                weakView.backgroundColor = .green
                averageView.backgroundColor = .green
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = false
                descriptionPasswordlbl.text = self.holdUp
                descriptionPasswordlbl.textColor = .green
                
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Average".localized
                strongPasswordLbl.textColor = .green
                newPasswordView.backgroundColor = .green
                return true
                
            }else if newPasswordTxt.text!.count > 3 && newPasswordTxt.text!.count <= 5 {
                
                weakView.backgroundColor = .yellow
                averageView.backgroundColor = .yellow
                goodView.backgroundColor = .yellow
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = true
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Good"
                strongPasswordLbl.textColor = .yellow
                newPasswordView.backgroundColor = .yellow
                return true
                
            } else if newPasswordTxt.text!.count > 5 {
                
                weakView.backgroundColor = .red
                averageView.backgroundColor = .red
                goodView.backgroundColor = .red
                StrongView.backgroundColor = .red
                
                descriptionPasswordlbl.isHidden = true
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Strong".localized
                strongPasswordLbl.textColor = .red
                newPasswordView.backgroundColor = .red
                return true
                
            }
            return true
            
        } else if (textField == currentPasswordTxt) {
            currentPasswordTxt.becomeFirstResponder()
           
            if currentPasswordTxt.text!.isEmpty {
               currentPasswordView.backgroundColor = .white
               descriptionCurrentPasswordLbl.isHidden = true
               return true
                }
            else { // if currentPasswordTxt.text!.count > 0  &&  currentPasswordTxt.text!.count < 6 {
                currentPasswordView.backgroundColor = .red
                descriptionCurrentPasswordLbl.isHidden = false
                currentPasswordView.backgroundColor = .red
                descriptionCurrentPasswordLbl.textColor = .red
                descriptionCurrentPasswordLbl.text = self.holdUp6Character
                return true
                }
            }
            return true
        }
   
 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if (textField == newPasswordTxt) {
            newPasswordTxt.becomeFirstResponder()
            if newPasswordTxt.text!.isEmpty{
                strongPasswordLbl.isHidden = true
                descriptionPasswordlbl.isHidden = true
                newPasswordView.backgroundColor = .white
                
                
                weakView.backgroundColor = .clear
                averageView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                newPasswordView.backgroundColor = .white
                return true
                
                
            }else if newPasswordTxt.text!.count == 0  {
                strongPasswordLbl.isHidden = true
                descriptionPasswordlbl.isHidden = true
                newPasswordView.backgroundColor = .white
                
                weakView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                averageView.backgroundColor = .clear
                
                newPasswordView.backgroundColor = .white
            }
            else if newPasswordTxt.text!.count > 0 && newPasswordTxt.text!.count < 2 {
                weakView.backgroundColor = .orange
                averageView.backgroundColor = .clear
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = false
                descriptionPasswordlbl.text = self.holdUp
                descriptionPasswordlbl.textColor = .orange
                
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Weak".localized
                strongPasswordLbl.textColor = .orange
                newPasswordView.backgroundColor = .orange
                return true
                
                
            }else if newPasswordTxt.text!.count >= 2 && newPasswordTxt.text!.count <= 3 {
                
                weakView.backgroundColor = .green
                averageView.backgroundColor = .green
                goodView.backgroundColor = .clear
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = false
                descriptionPasswordlbl.text = self.holdUp
                descriptionPasswordlbl.textColor = .green
                
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Average".localized
                strongPasswordLbl.textColor = .green
                newPasswordView.backgroundColor = .green
                return true
                
            }else if newPasswordTxt.text!.count > 3 && newPasswordTxt.text!.count <= 5 {
                
                weakView.backgroundColor = .yellow
                averageView.backgroundColor = .yellow
                goodView.backgroundColor = .yellow
                StrongView.backgroundColor = .clear
                
                descriptionPasswordlbl.isHidden = true
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Good".localized
                strongPasswordLbl.textColor = .yellow
                newPasswordView.backgroundColor = .yellow
                return true
                
            } else if newPasswordTxt.text!.count > 5 {
                
                weakView.backgroundColor = .red
                averageView.backgroundColor = .red
                goodView.backgroundColor = .red
                StrongView.backgroundColor = .red
                
                descriptionPasswordlbl.isHidden = true
                strongPasswordLbl.isHidden = false
                strongPasswordLbl.text = "Strong".localized
                strongPasswordLbl.textColor = .red
                newPasswordView.backgroundColor = .red
                return true
                
            }
            return true
            
        } else if (textField == currentPasswordTxt) {
            currentPasswordTxt.becomeFirstResponder()
            if currentPasswordTxt.text!.count > 0  &&  currentPasswordTxt.text!.count < 6 {
                currentPasswordView.backgroundColor = .red
                descriptionCurrentPasswordLbl.isHidden = false
                currentPasswordView.backgroundColor = .red
                descriptionCurrentPasswordLbl.textColor = .red
                descriptionCurrentPasswordLbl.text = self.holdUp6Character
                return true
                }  else  {
                currentPasswordView.backgroundColor = .white
                descriptionCurrentPasswordLbl.isHidden = true
                return true
                    }
                }
            return true
         }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if currentPasswordTxt.text!.isEmpty{
           currentPasswordView.backgroundColor = .white
            descriptionCurrentPasswordLbl.isHidden = true
            view.endEditing(true)

        }
        else if currentPasswordTxt.text!.count > 0 && currentPasswordTxt.text!.count < 6 {
            descriptionCurrentPasswordLbl.isHidden = false
            currentPasswordView.backgroundColor = .red
            descriptionCurrentPasswordLbl.textColor = .red
            descriptionCurrentPasswordLbl.text = self.holdUp6Character
            view.endEditing(true)

        } else if currentPasswordTxt.text!.count >= 6 {
            descriptionCurrentPasswordLbl.isHidden = true
            currentPasswordView.backgroundColor = .white
            view.endEditing(true)

        }
        
        // new password
        if newPasswordTxt.text!.isEmpty{
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            
            newPasswordView.backgroundColor = .white
            view.endEditing(true)

        }else if newPasswordTxt.text!.count == 0  {
            strongPasswordLbl.isHidden = true
            descriptionPasswordlbl.isHidden = true
            newPasswordView.backgroundColor = .white
            
            weakView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            averageView.backgroundColor = .clear
            
            newPasswordView.backgroundColor = .white
        }
        else if newPasswordTxt.text!.count > 0 && newPasswordTxt.text!.count < 2 {
            weakView.backgroundColor = .orange
            averageView.backgroundColor = .clear
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text = self.holdUp
            descriptionPasswordlbl.textColor = .orange

            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Weak".localized
            strongPasswordLbl.textColor = .orange
            newPasswordView.backgroundColor = .orange

            view.endEditing(true)

        } else if newPasswordTxt.text!.count >= 2 && newPasswordTxt.text!.count <= 3 {
           
            weakView.backgroundColor = .green
            averageView.backgroundColor = .green
            goodView.backgroundColor = .clear
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = false
            descriptionPasswordlbl.text = self.holdUp
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Average".localized
            strongPasswordLbl.textColor = .green
            newPasswordView.backgroundColor = .green
            view.endEditing(true)

        } else if newPasswordTxt.text!.count > 3 && newPasswordTxt.text!.count <= 5 {
        
            weakView.backgroundColor = .yellow
            averageView.backgroundColor = .yellow
            goodView.backgroundColor = .yellow
            StrongView.backgroundColor = .clear
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Good".localized
            strongPasswordLbl.textColor = .yellow
            newPasswordView.backgroundColor = .yellow
            view.endEditing(true)


        }    else if newPasswordTxt.text!.count > 5{
         
            weakView.backgroundColor = .red
            averageView.backgroundColor = .red
            goodView.backgroundColor = .red
            StrongView.backgroundColor = .red
            
            descriptionPasswordlbl.isHidden = true
            strongPasswordLbl.isHidden = false
            strongPasswordLbl.text = "Strong".localized
            strongPasswordLbl.textColor = .red
            newPasswordView.backgroundColor = .red
            view.endEditing(true)


         }
        view.endEditing(true)

     }
}
 

 
