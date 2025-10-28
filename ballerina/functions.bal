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

# Await for a condition to be true.
#
# + conditionFunc - condition function or boolean value to wait for
# + return - return error if the operation fails, otherwise wait until the condition is true. Successful await returns nil.
public function await((function () returns boolean)|boolean conditionFunc) returns error? {
    // Implementation for pausing the workflow until the condition is true
}

# Sleep for the specified duration.
#
# + duration - duration to sleep for
# + return - return error if the operation fails, otherwise wait for the specified duration. Successful sleep returns nil.
public function sleep(Duration duration) returns error? {
    // Implementation for sleeping/waiting for the specified duration
}