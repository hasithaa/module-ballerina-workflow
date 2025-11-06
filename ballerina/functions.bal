// Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
import ballerina/jballerina.java;

# Await for a condition to be true.
#
# + conditionFunc - condition function or boolean value to wait for
# + return - return error if the operation fails, otherwise wait until the condition is true. Successful await returns nil.
@Activity
public function await((function () returns boolean)|boolean conditionFunc) returns NotInWorkflowError|UnsupportedOperationError|error? {
    PersistentProvider provider = check getCurrentProvider();
    WorkflowOperators workflowOperators = check provider.getWorkflowOperators();
    if conditionFunc is boolean {
        return error UnsupportedOperationError("Operation not supported", operation = "await");
    }
    return workflowOperators.await(conditionFunc);
}

public function awaitWithTimeout((function () returns boolean)|boolean conditionFunc, Duration timeout) returns boolean|NotInWorkflowError|UnsupportedOperationError|error {
    PersistentProvider provider = check getCurrentProvider();
    WorkflowOperators workflowOperators = check provider.getWorkflowOperators();
    if conditionFunc is boolean {
        return error UnsupportedOperationError("Operation not supported", operation = "awaitWithTimeout");
    }
    return workflowOperators.awaitWithTimeout(conditionFunc, timeout);
}

# Sleep for the specified duration.
#
# + duration - duration to sleep for
# + return - return error if the operation fails, otherwise wait for the specified duration. Successful sleep returns nil.
@Activity
public function sleep(Duration duration) returns NotInWorkflowError|error? {
    PersistentProvider provider = check getCurrentProvider();
    WorkflowOperators workflowOperators = check provider.getWorkflowOperators();
    return workflowOperators.sleep(duration);
}

public function currentTimeMillis() returns int|NotInWorkflowError|error {
    PersistentProvider provider = check getCurrentProvider();
    WorkflowOperators workflowOperators = check provider.getWorkflowOperators();
    return workflowOperators.currentTimeMillis();
}

function getCurrentProvider() returns PersistentProvider|NotInWorkflowError {
    PersistentProvider? provider = getProviderExternal();
    if provider is () {
        return error NotInWorkflowError("No PersistentProvider");
    }
    return provider;
}

function getProviderExternal() returns PersistentProvider? = @java:Method {
    'class: "io.ballerina.stdlib.workflow.runtime.PersistentProviderHolder",
    name: "getProvider"
} external;

public type UnsupportedOperationError distinct error<UnsupportedOperationDetails>;

public type UnsupportedOperationDetails record {
    string reason = "This operation is not supported in the current context.";
    string operation;
};

public type NotInWorkflowError distinct error<NotInWorkflowDetails>;

public type NotInWorkflowDetails record {
    string reason = "The operation is only supported inside a workflow execution context.";
};

