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
