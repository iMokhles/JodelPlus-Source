%hook JDLPictureFeedCell
- (void)loadImages:(id)arg1 {

    %orig();
}
%end

%hook JDLPictureFeedMainNavigationController
- (void)viewDidLoad {

    %orig();
}
%new
- (void)save {

}
%new
- (void)dropdownAlertWasTapped:(id)arg1 {

}

%new
- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {

}
%end

%hook JDLImagePreviewViewController
- (void)viewDidLoad {

    %orig();
}

- (void)setupGeoFilter {

    %orig();
}
%end

@interface JDLImageCaptureViewController : UIViewController
@end

%hook JDLImageCaptureViewController
- (void)viewDidLoad {

    %orig();
}
%new
- (void)showPicker {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.delegate   = self;
    picker.sourceType = 0;
        
    [self presentViewController:picker animated:YES completion:nil];
}

%new
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [picker pushViewController:editor animated:YES];
}

%new
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
}

%new
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image
{
    [[id previewImageView] setImage:image];
    [id setPreviewImage:image];    
}
%new
- (void)imageEditorDidCancel:(CLImageEditor*)editor {

}
%end

%hook NSBundle
- (NSString *)pathForResource: (NSString *)resourceName ofType: (NSString *)resourceType {
    if ([resourceName isEqualToString:@"CLImageEditor"]) {
        return "/Library/Application Support/JodelPlus/jodelResources.bundle/CLImageEditor.bundle";
    }
    return %orig;
}
%end

%hook JDLUserSectionViewController
- (void)viewDidLoad {

    %orig();
}
%new
- (void)changeSwitch {

}

%new
- (void)showprefs {
    [[JodelPrefs sharedInstance] loadJodelPrefsOnViewController:self];
}
%end

%hook SettingViewController
- (void)viewDidLoad {

    %orig();
}
%new
- (void)changeSwitch {

}

%new
- (void)showprefs {
    [[JodelPrefs sharedInstance] loadJodelPrefsOnViewController:self];
}
%end

%hook JDLExperiments
- (_Bool)channelsFeatureEnabled {
    return true;
}
- (_Bool)hashtagSearchPromptEnabled {
    return YES;
}
- (_Bool)feedSearchEnabled {
    return true;
}
- (_Bool)mentionPromptEnabled {
    return true;
}
%end

%hook TLMComposeViewController
- (_Bool)canPerformAction:(SEL)arg1 withSender:(id)arg2 {
    return true;
}
%end

%hook Paste
- (void)setPasteOptionEnabled:(_Bool)arg1 {
    %orig(true);
} 
%end

%hook UIVisualEffectView
- (void)layoutSubviews {

    %orig();
}
%end

%hook JDLBasePostCellViewModel
- (void)didSelect {

    %orig();
}
- (_Bool)dropdownAlertWasTapped {
    return true;
}
%end

