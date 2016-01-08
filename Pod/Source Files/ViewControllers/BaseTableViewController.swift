//
//  REPlenishBaseTableViewController.swift
//  REPlenish
//
//  Created by William Hindenburg on 9/22/15.
//  Copyright © 2015 Robot Woods, LLC. All rights reserved.
//

import UIKit
import KVNProgress

public class BaseTableViewController: UITableViewController {
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: animated)
        self.tableView.tableFooterView = UIView()
    }
    
    public func showActivityIndicatorAnimated(animated:Bool) {
        KVNProgress.show()
    }
    
    public func hideActivityIndicatorAnimated(animated:Bool) {
        KVNProgress.dismiss()
    }
    
    public func createAlertController(title:String, message:String, defaultButton:Bool) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        if defaultButton {
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
            })
            alertController.addAction(alertAction)
        }
        return alertController
    }
    
    public func displayGenericNetworkError() {
        let alert = self.createAlertController("Error", message: "Something went wrong, please try again", defaultButton: true)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    public func displayError(error:NSError) {
        let alert = self.createAlertController("Error", message: error.localizedDescription, defaultButton: true)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    public func displayLocationServicesNotEnabledError() {
        let alertController = UIAlertController(
            title: "Location Access Disabled",
            message: "To enable Scrub Tech to use your location please open this app's settings and set location access to 'While Using the App'.",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
            if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        alertController.addAction(openAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    public func displayLocationServicesNotAvaliableError() {
        let alertController = UIAlertController(
            title: "Location Access Disabled",
            message: "To enable Scrub Tech your location is required. Your location is not available.",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    public func displayDeviceLocationServicesNotAvaliableError() {
        let alertController = UIAlertController(
            title: "Location Services Disabled",
            message: "To enable Scrub Tech your location is required. Your location is not available on your device.  Please enable your device location services",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    public func showError(error:NSError, retryBlock:(Void -> Void)) {
        
    }
    
    /*
    - (void)showError:(NSError *)error withRetryBlock:(void (^)(void))completion {
    if ([User persistentUserObject].sessionToken) {
    NSString *errorMessage = [error localizedDescription];
    NSString *title;
    UIAlertControllerStyle style = UIAlertControllerStyleActionSheet;
    
    if (error.code == ServiceErrorForceUpgrade) {
    title = [error.userInfo objectForKey:kForceUpgradeTitleKey];
    style = UIAlertControllerStyleAlert;
    } else if ([error code] == ServiceErrorMaintenanceMode) {
    title = [error.userInfo objectForKey:kMaintenanceModeErrorTitleKey];
    }
    
    if (title == nil) {
    title = @"Error";
    }
    
    UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:title message:errorMessage preferredStyle:style];
    
    if (error.code != ServiceErrorForceUpgrade) {
    [errorAlert addAction:[UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
    if (completion) completion();
    }]];
    } else {
    NSString *url = [error.userInfo objectForKey:kForceUpgradeURL];
    if (url) {
    [errorAlert addAction:[UIAlertAction actionWithTitle:@"Upgrade" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    }]];
    }
    
    }
    
    [errorAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:errorAlert animated:YES completion:nil];
    }
    
    }
*/

}
