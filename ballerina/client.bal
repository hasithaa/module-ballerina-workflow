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


# A client to interact with the workflow engine.
public type WorkflowEngineClient isolated client object {

    isolated remote function search(string process, map<anydata> cid) returns Execution?|error;

    isolated remote function startNew(string workflowName, string methodName, anydata... args) returns Execution|error;

    isolated remote function signal(Execution execution, string signalName, anydata... args) returns error?;

    isolated remote function update(Execution execution, string updateName, anydata... args) returns anydata|error;

    isolated remote function query(Execution execution, string queryName, anydata... args) returns anydata|error;

    isolated remote function stop(Execution execution) returns error?;
};