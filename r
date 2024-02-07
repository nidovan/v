public async Task<Community?> CreateCommunity(string displayName, string description)
  {
    _ = _graphServiceClient ??
        throw new System.NullReferenceException("Graph has not been initialized");

    var community = new Community
    {
      DisplayName = displayName,
      Description = description,
      Privacy = CommunityPrivacy.Public
    };

    // Create community is asynchronous and returns 202 + location header for the long running operation.
    // To access this we need to use a NativeResponseHandler.
    var nativeResponseHandler = new NativeResponseHandler();
    await _graphServiceClient.EmployeeExperience.Communities.PostAsync(community, requestConfiguration => requestConfiguration.Options.Add(new ResponseHandlerOption() { ResponseHandler = nativeResponseHandler }));
    using var responseMessage = nativeResponseHandler.Value as HttpResponseMessage;
    if (responseMessage == null || responseMessage?.StatusCode != System.Net.HttpStatusCode.Accepted)
    {
      throw new Exception($"Failed to create community. Status code: {responseMessage?.StatusCode}");
    }

    // Not sure if there is a better way to pass a resource URL to the client.
    // For now just parse the operation id from the URL.
    var location = responseMessage?.Headers.Location!.ToString();
    var startPos = location.IndexOf("('") + "('".Length;
    var length = location.IndexOf("')") - startPos;
    var operationId = location.Substring(startPos, length);

    // Now we need to poll the long running operation for status updates.
    string? communityId = null;
    var retryCount = 0;
    while (communityId == null && retryCount <= 5)
    {
      retryCount++;
      await Task.Delay(5000);
      
      var operation = await _graphServiceClient.EmployeeExperience.EngagementAsyncOperations[operationId].GetAsync();
      if (operation == null)
      {
        continue;
      }

      if (operation.Status.Value == LongRunningOperationStatus.Failed)
      {
        throw new Exception($"Failed to create community: {operation.StatusDetail}");
      }

      if (operation.Status.Value == LongRunningOperationStatus.Succeeded)
      {
        communityId = operation.ResourceId;
        break;
      }
    }

    if (communityId == null)
    {
      throw new Exception($"Failed to create community. Operation timed out.");
    }

    // Now we have the community id, we can fetch the created community.
    return await _graphServiceClient.EmployeeExperience.Communities[communityId].GetAsync();
  }
