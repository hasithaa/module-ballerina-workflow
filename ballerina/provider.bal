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

# Workflow Persistent Provider
public type PersistentProvider distinct isolated object {

    public isolated function registerWorkflowModel(WorkflowModel svc, WorkflowModelDetails details, string workflowName, Activities activities) returns error?;

    public isolated function unregisterWorkflowModel(WorkflowModel svc) returns error?;

    public isolated function 'start() returns error?;

    public isolated function stop() returns error?;

    public isolated function getClient() returns WorkflowEngineClient|error;

    public isolated function getWorkflowOperators() returns WorkflowOperators|error;
};

public type WorkflowOperators distinct isolated client object {

    isolated remote function await(boolean conditionFunc) returns NotInWorkflowError|error?;

    isolated remote function sleep(Duration duration) returns NotInWorkflowError|error?;
};

# A client to interact with the workflow engine.
public type WorkflowEngineClient isolated client object {

    isolated remote function execute(WorkflowModel svc, anydata... args) returns Execution|error;

    isolated remote function signal(WorkflowModel svc, Execution execution, string signalName, anydata... args) returns error?;

    isolated remote function query(WorkflowModel svc, Execution execution, string queryName, anydata... args) returns anydata|error;

    isolated remote function callActivity(function acticity, anydata... args) returns anydata|error;
};
