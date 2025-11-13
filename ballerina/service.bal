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

import workflow.internal;

# Workflow Event Listener
#
# An event listener to manage the workflow and event interactions with the workflow engine.
public isolated class WorkflowEventListener {

    final PersistentProvider persistentProvider;

    public isolated function init(PersistentProvider persistentProvider) {
        self.persistentProvider = persistentProvider;
    }

    public isolated function attach(WorkflowModel svc, string workflowName) returns error? {

        WorkflowMethods details = check getServiceModel(svc);
        final WorkflowModelData data = {
            workflowName: workflowName,
            execute: details.execute,
            signals: details.signals,
            queries: details.queries,
            // Assume we have desugared the workflow activities at compile time.
            activities: (typeof svc).@internal:__WorkflowActivities ?: {}
        };
        check self.persistentProvider.registerWorkflowModel(svc, data);
    }

    public isolated function detach(WorkflowModel svc) returns error? {
        check self.persistentProvider.unregisterWorkflowModel(svc);
    }

    public isolated function 'start() returns error? {
        check self.persistentProvider.'start();
    }

    public isolated function gracefulStop() returns error? {
        check self.persistentProvider.stop();
    }

    public isolated function immediateStop() returns error? {
        check self.persistentProvider.stop();
    }

    public isolated function getClient() returns WorkflowEngineClient|error {
        return check self.persistentProvider.getClient();
    }
}

# Workflow Service Model
public type WorkflowModel distinct service object {};
