//
//  JoinViewController.m
//  Snap
//
//  Created by Ray Wenderlich on 5/24/12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import "JoinViewController.h"
#import "UIFont+SnapAdditions.h"

@interface JoinViewController ()
@property (nonatomic, weak) IBOutlet UILabel *headingLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UIView *waitView;
@property (nonatomic, weak) IBOutlet UILabel *waitLabel;
@end

@implementation JoinViewController
{
	MatchmakingClient *_matchmakingClient;
}

@synthesize delegate = _delegate;

@synthesize headingLabel = _headingLabel;
@synthesize nameLabel = _nameLabel;
@synthesize nameTextField = _nameTextField;
@synthesize statusLabel = _statusLabel;
@synthesize tableView = _tableView;

@synthesize waitView = _waitView;
@synthesize waitLabel = _waitLabel;

- (void)dealloc
{
#ifdef DEBUG
	NSLog(@"dealloc %@", self);
#endif
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	self.headingLabel.font = [UIFont rw_snapFontWithSize:24.0f];
	self.nameLabel.font = [UIFont rw_snapFontWithSize:16.0f];
	self.statusLabel.font = [UIFont rw_snapFontWithSize:16.0f];
	self.waitLabel.font = [UIFont rw_snapFontWithSize:18.0f];
	self.nameTextField.font = [UIFont rw_snapFontWithSize:20.0f];
    
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.nameTextField action:@selector(resignFirstResponder)];
	gestureRecognizer.cancelsTouchesInView = NO;
	[self.view addGestureRecognizer:gestureRecognizer];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	self.waitView = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
	if (_matchmakingClient == nil)
	{
		_matchmakingClient = [[MatchmakingClient alloc] init];
		[_matchmakingClient startSearchingForServersWithSessionID:SESSION_ID];
        
		self.nameTextField.placeholder = _matchmakingClient.session.displayName;
		[self.tableView reloadData];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)exitAction:(id)sender
{
	[self.delegate joinViewControllerDidCancel:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}

@end
