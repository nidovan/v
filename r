/* App.css */
.app-container {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Ensures the container covers the full height of the viewport */
}

.content-container {
    flex: 1; /* Takes up all available space */
    background-color: #f4f4f4; /* Light grey background for the content area */
    padding: 20px; /* Padding for the content area */
}

.footer {
    background-color: #333; /* Dark grey background for the footer */
    color: #fff; /* White text color for the footer */
    text-align: center;
    padding: 10px 20px; /* Padding for the footer */
    position: relative;
    bottom: 0;
    width: 100%;
}

/* Container below the top navigation with grey background */
.grey-container {
    background-color: #e1e1e1; /* Grey background color */
    width: 100%;
    height: 100%; /* Ensures it covers the height of its container */
}






   <FluentProvider theme={teamsLightTheme}>
            <div className="app-container">
                <TopNavigation />
                <div className="content-container">
                    {/* Your main content goes here */}
                </div>
                <footer className="footer">
                    <p>&copy; 2024 Your Company Name. All rights reserved.</p>
                </footer>
            </div>
        </FluentProvider>
