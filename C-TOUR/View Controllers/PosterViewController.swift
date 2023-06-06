//
//  PostViewController.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/21/23.
//

import UIKit
import ParseSwift
import PhotosUI

class PosterViewController: UIViewController{

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var choosePhotoButton: UIButton!
    private var pickedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onPickImageTapped(_ sender: UIBarButtonItem) {
        var config = PHPickerConfiguration()

        
        config.filter = .images

        config.preferredAssetRepresentationMode = .current

        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self

        present(picker, animated: true)
    }
    
    
    
    
    
    @IBAction func sharePhotoTapped(_ sender: UIBarButtonItem) {
        
        guard let image = pickedImage,
              // Create and compress image data (jpeg) from UIImage
              let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }

        // Create a Parse File by providing a name and passing in the image data
        let imageFile = ParseFile(name: "image.jpg", data: imageData)

        // Create Post object
        var post = Post()

        // Set properties
        post.imageFile = imageFile

        // Set the user as the current user
        post.user = User.current

        // Save object in background (async)
        post.save { [weak self] result in

            // Switch to the main thread for any UI updates
            DispatchQueue.main.async {
                switch result {
                case .success(let post):
                    print("✅ Post Saved! \(post)")

                    // Return to previous view controller
                    self?.navigationController?.popViewController(animated: true)

                case .failure(let error):
                    self?.showAlert(description: error.localizedDescription)
                }
            }
        }
    }
    

    @IBAction func onTakePhotoTapped(_ sender: UIBarButtonItem) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("❌📷 Camera not available")
            return
        }

        // Instantiate the image picker
        let imagePicker = UIImagePickerController()

        // Shows the camera (vs the photo library)
        imagePicker.sourceType = .camera


        imagePicker.allowsEditing = true

        imagePicker.delegate = self

        // Present the image picker (camera)
        present(imagePicker, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
extension PosterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // Dismiss the image picker
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("❌📷 Unable to get image")
            return
        }
        imageView.image = image
        pickedImage = image
        
    }

}

extension PosterViewController: PHPickerViewControllerDelegate {


    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

        
        picker.dismiss(animated: true)

        guard let provider = results.first?.itemProvider,
   
              provider.canLoadObject(ofClass: UIImage.self) else { return }


        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in

  
            guard let image = object as? UIImage else {
                self?.showAlert()
                return
            }

    
            if let error = error {
                self?.showAlert(description: error.localizedDescription)
                return
            } else {


                DispatchQueue.main.async {

                    self?.imageView.image = image

                    self?.pickedImage = image
                }
            }
        }
    }
}

