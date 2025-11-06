
# Check if the current workflow execution is in replaying mode.
# 
# + return - returns true if the workflow is replaying, false otherwise
# 
# # Deprecated
# Usage of this function is discouraged. This is an internal function.
# Writing workflow logic based on this may affect the determinism of the workflow. Hence, this function is marked as deprecated.
@deprecated
public function __isReplaying() returns boolean  = external;


# Invoke an activity by name with the given arguments.
# 
# + activity - name of the activity to invoke
# + activityId - identifier of the activity to invoke
# + args - arguments to pass to the activity
#
# + return - returns the result of the activity invocation or an error if the invocation fails
# # Deprecated
# Usage of this function is discouraged. This is an internal function.
# Writing workflow logic based on this may affect the determinism of the workflow. Hence, this function is marked as deprecated.
@deprecated
public function __invokeActivity(string activity, string activityId, anydata... args) returns anydata|error = external;


# Get the result from the last invocation of the specified activity.
# 
# + activityId - identifier of the activity
# + return - returns the result of the last activity invocation or an error if retrieval fails
# # Deprecated
# Usage of this function is discouraged. This is an internal function.
@deprecated
public function __getResultFromLastActivity(string activityId) returns anydata|error = external;