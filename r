 string ldapPath = "LDAP://your-ldap-server/"; // Replace with your LDAP server URL
        string baseDn = "DC=example,DC=com"; // Replace with your base DN

        // Create a DirectoryEntry object with the LDAP path
        using (DirectoryEntry entry = new DirectoryEntry(ldapPath + baseDn))
        {
            try
            {
                // Create a DirectorySearcher to search for the user
                using (DirectorySearcher searcher = new DirectorySearcher(entry))
                {
                    // Specify the LDAP filter to find a specific user by their username
                    searcher.Filter = "(&(objectCategory=person)(objectClass=user)(sAMAccountName=username))";
                    // Replace 'username' with the actual username you want to retrieve.

                    // Perform the search and get the search result
                    SearchResult result = searcher.FindOne();

                    if (result != null)
                    {
                        // Access user properties
                        Console.WriteLine("User Properties:");
                        Console.WriteLine("Display Name: " + result.Properties["displayName"][0]);
                        Console.WriteLine("Email: " + result.Properties["mail"][0]);
                        // You can access other properties as needed.

                        // You can also loop through all properties if necessary.
                        foreach (string propertyName in result.Properties.PropertyNames)
                        {
                            Console.WriteLine($"{propertyName}: {result.Properties[propertyName][0]}");
                        }
                    }
                    else
                    {
                        Console.WriteLine("User not found.");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
