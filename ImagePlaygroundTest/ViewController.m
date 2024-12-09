//
//  ViewController.m
//  ImagePlaygroundTest
//
//  Created by Brendan Duddridge on 12/9/24.
//

#import "ViewController.h"
#import "ImagePlaygroundTest-Swift.h"

@interface ViewController()<TFImagePlaygroundDelegate>
@property (nonatomic, weak) IBOutlet NSImageView *imageView;
@property (nonatomic, strong) TFImagePlaygroundManager *playgroundManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.playgroundManager = [[TFImagePlaygroundManager alloc] initWithDelegate:self];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)showImagePlayground:(id)sender {
    [self.playgroundManager showImagePlaygroundFromController:self];
}

- (void)didCancelImageCreationWithPlaygroundViewController:(NSViewController * _Nonnull)playgroundViewController { 
    
}

- (void)didCreateImageAtImageURL:(NSURL * _Nonnull)imageURL { 
    NSImage *generatedImage = [[NSImage alloc] initWithContentsOfURL:imageURL];
    self.imageView.image = generatedImage;
}

@end
