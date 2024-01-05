string ldapPath = "LDAP://YourLDAPServerAddress"; // Replace this with your LDAP server address
        string baseDN = "DC=example,DC=com"; // Replace this with your base distinguished name

        DirectoryEntry entry = new DirectoryEntry(ldapPath);
        DirectorySearcher searcher = new DirectorySearcher(entry);

        searcher.Filter = "(objectCategory=organizationalUnit)";
        searcher.SearchScope = SearchScope.Subtree;
        searcher.PropertiesToLoad.Add("*"); // Load all properties

        StringBuilder ouProperties = new StringBuilder();

        try
        {
            SearchResultCollection results = searcher.FindAll();

            foreach (SearchResult result in results)
            {
                DirectoryEntry entryFound = result.GetDirectoryEntry();

                // Append OU name
                ouProperties.AppendLine($"OU Name: {entryFound.Name}");

                // Append properties
                foreach (string propertyName in entryFound.Properties.PropertyNames)
                {
                    ouProperties.AppendLine($"{propertyName}:");
                    foreach (object propertyValue in entryFound.Properties[propertyName])
                    {
                        ouProperties.AppendLine($"- {propertyValue}");
                    }
                }
                ouProperties.AppendLine(); // Add a separator between OUs
            }
        }











 try
        {
            string ldapServer = "example.com";
            int ldapPort = 389;
            string baseDN = "ou=Divisions,ou=Data,o=m";
            string filter = "(divisioncode=*)"; // Modify the filter as needed
            string[] attributesToReturn = { "divisioncode", "description" }; // Adjust the attributes you want to retrieve

            LdapDirectoryIdentifier identifier = new LdapDirectoryIdentifier(ldapServer, ldapPort);
            LdapConnection connection = new LdapConnection(identifier);

            connection.AuthType = AuthType.Negotiate; // Using GSSAPI

            connection.Bind(); // Anonymous bind - Adjust this according to your authentication requirements

            SearchRequest searchRequest = new SearchRequest(
                baseDN,
                filter,
                SearchScope.Subtree,
                attributesToReturn
            );

            SearchResponse searchResponse = (SearchResponse)connection.SendRequest(searchRequest);

            if (searchResponse.Entries.Count > 0)
            {
                foreach (SearchResultEntry entry in searchResponse.Entries)
                {
                    Console.WriteLine("Entry:");
                    foreach (string attributeName in entry.Attributes.AttributeNames)
                    {
                        Console.WriteLine($"{attributeName}: {entry.Attributes[attributeName][0]}");
                    }
                }
            }
            else
            {
                Console.WriteLine("No entries found.");
            }

            connection.Dispose();
        }
        catch (LdapException ldapEx)
        {
            Console.WriteLine($"LDAP Exception: {ldapEx.Message}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }






 string ldapServer = "ldap://your-ldap-server:port"; // Replace with your LDAP server details
        string username = "username"; // Replace with your LDAP username
        string password = "password"; // Replace with your LDAP password
        string searchBase = "ou=divisions,ou=data"; // Replace with your search base DN

        try
        {
            LdapConnection ldapConnection = new LdapConnection(ldapServer);
            ldapConnection.AuthType = AuthType.Basic;
            ldapConnection.SessionOptions.ProtocolVersion = 3; // Use LDAP v3
            ldapConnection.Credential = new System.Net.NetworkCredential(username, password);
            ldapConnection.Bind();

            SearchRequest searchRequest = new SearchRequest(
                searchBase,
                "(&(objectClass=*))", // Replace this filter as per your search requirements
                SearchScope.Subtree // You can change the scope of the search as needed
            );

            SearchResponse searchResponse = (SearchResponse)ldapConnection.SendRequest(searchRequest);

            foreach (SearchResultEntry entry in searchResponse.Entries)
            {
                Console.WriteLine("DN: " + entry.DistinguishedName);
                foreach (string attributeName in entry.Attributes.AttributeNames)
                {
                    Console.WriteLine(attributeName + ": " + entry.Attributes[attributeName][0]);
                }
                Console.WriteLine("----------------------------------");
            }

            ldapConnection.Dispose();
        }
        catch (LdapException e)
        {
            Console.WriteLine("LDAP Exception: " + e.Message);
        }
        catch (Exception e)
        {
            Console.WriteLine("Exception: " + e.Message);
        }
