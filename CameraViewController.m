//
//  CameraViewController.m
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import "CameraViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <Parse/Parse.h>

@interface CameraViewController ()
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *chosenImageView;
@property (nonatomic, assign) BOOL imagePickerIsDisplayed;
@end

@implementation CameraViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleTextField.layer.borderWidth = 1.0;
    self.titleTextField.layer.cornerRadius = 5.0;


}

//Hides Photos label in image picker

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.navigationItem setTitle:@""];
    if ([navigationController isKindOfClass:[UIImagePickerController class]])
    {
        viewController.navigationController.navigationBar.translucent = YES;
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    [super viewWillAppear:animated];
    
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.navigationController.navigationBar.translucent = NO;

    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    self.imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
    if (!self.imagePickerIsDisplayed) {
        [self presentViewController:self.imagePicker animated:NO completion:nil];
        self.imagePickerIsDisplayed = YES;
        
        
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self clear];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.chosenImageView.image = chosenImage;
    [self dismissViewControllerAnimated:YES completion:^{self.imagePickerIsDisplayed = NO;}];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.tabBarController setSelectedIndex:0];
    self.imagePickerIsDisplayed = NO;
}

- (void)clear {
    self.chosenImageView.image = nil;
    self.titleTextField.text = nil;
}

- (IBAction)share:(id)sender {
    if (self.chosenImageView.image) {
        NSData *imageData = UIImagePNGRepresentation(self.chosenImageView.image);
        PFFile *photoFile = [PFFile fileWithData:imageData];
        PFObject *photo = [PFObject objectWithClassName:@"Photo"];
        photo[@"image"] = photoFile;
        photo[@"whoTook"] = [PFUser currentUser];
        photo[@"title"] = self.titleTextField.text;
        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!succeeded) {
                [self showError];
            }
        }];
    }
    else {
        [self showError];
    }
    [self clear];
    [self.tabBarController setSelectedIndex:0];
    
}

- (void)showError {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Could not post your photo, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.titleTextField resignFirstResponder];
}




@end
