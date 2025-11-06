
# Annotation to specify the workflow activities attached to a workflow service
# 
# # Deprecated
# Usage of this annotation is discouraged. This is an internal annotation.
@deprecated
public annotation __AttachedActivities __WorkflowActivities on service remote function;


# Record type to hold the list of activities attached to a workflow service
# # Deprecated
# Usage of this type is discouraged. This is an internal type.
@deprecated
public type __AttachedActivities record {

    # List of activity names attached to the workflow service
    map<function> __activities;
};