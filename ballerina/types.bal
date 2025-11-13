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

# Represents a duration of time interval.
public type Duration record {
    # Number of months
    int months?;
    # Number of days
    int days?;
    # Number of hours
    int hours?;
    # Number of minutes
    int minutes?;
    # Number of seconds
    int seconds?;
    # Number of milliseconds
    int milliseconds?;
};

# Represents a workflow execution.
public type Execution record {|
    # The unique identifier of the workflow execution.
    string id;
|};

public type Activities map<function>;

public type WorkflowModelDetails record {|
    WorkflowAction execute;
    map<WorkflowAction> signals;
    map<WorkflowAction> queries;
|};

public type WorkflowAction record {|
    string name;
    Parameters parameters;
    typedesc returnType;
|};

public type Parameters map<typedesc>;
