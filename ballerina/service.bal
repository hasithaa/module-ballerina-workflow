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

# Workflow Event Listener
#
# An event listener to manage the workflow and event interactions with the workflow engine.
public isolated class WorkflowEventListener {

    final PersistentProvider persistentProvider;
    public isolated function init(PersistentProvider persistentProvider) {
        self.persistentProvider = persistentProvider;
    }

    public isolated function attach(WorkflowModel svc, string attachPoint) returns error? {
    }

    public isolated function detach(WorkflowModel svc) returns error? {
    }

    public isolated function 'start() returns error? {
    }

    public isolated function gracefulStop() returns error? {
    }

    public isolated function immediateStop() returns error? {
    }

    public isolated function getClient() returns WorkflowEngineClient|error {
        return check self.persistentProvider.getClient();
    }
}

# Workflow Service Model
public type WorkflowModel distinct service object {};

# Workflow Persistent Provider
public type PersistentProvider distinct isolated object {

    public isolated function getClient() returns WorkflowEngineClient|error;
};