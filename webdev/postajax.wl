// Javascript functions to wait for an Ajax execution
// to finish, useful to run javascript code AFTER the Ajax
// code was executed AND AFTER the page is synchronized
// with the new updates made on the server

// Run the Server code of a Button, and wait
// until it ends and synchronizes the DOM
// NOTE: Will only work with buttons
function PostAJAX(Alias)
{
	_JAEE(_PAGE_,Alias,16,2);
	clWDAJAXMain.m_bInvokeAndWait = 1;
	clWDAJAXMain.TraiteAJAXExecuteEvenement();
}

// Just waits until the previously executed Ajax
// is done and the DOM is synchronized
// NOTE: This will NOT run any server code
function WaitAJAX()
{
	clWDAJAXMain.m_bInvokeAndWait = 1;
	clWDAJAXMain.TraiteAJAXExecuteEvenement();
}

// ================================
// Sample usage for PostAJAX
// ================================

// On a button with AJAX activated...

// @@ Browser Code Click
PostAJAX(Button..Alias)		// Execute the Server code
Info(EDT_Name)				// This code will be executed only after
							// the page's DOM is synchronized
RETURN 						// Avoid re-running the server code agean

// @@ Server Code
EDT_Name = Now()


// ================================
// Sample usage for WaitAJAX
// ================================

// On any Javascript event (timer, etc...)

// @@ Browser Code, anywhere
ExecuteProcess(COMBO, trtSelection)	// Execute the Server code
WaitAJAX()							// Wait until it's finished
Info(FSTC_Name)						// Display the new selection

// @@ COMBO Selection Server code
FSTC_Name = "A name..."
