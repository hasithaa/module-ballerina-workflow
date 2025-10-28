/*
 * Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com) All Rights Reserved.
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.stdlib.workflow.compiler.diagnostics;

/**
 * Compilation error codes used in Ballerina Workflow package compiler plugin.
 */
public enum DiagnosticCode {
    WORKFLOW_101,
    WORKFLOW_102,
    WORKFLOW_103,
    WORKFLOW_104,
    WORKFLOW_105,
    WORKFLOW_106,
    WORKFLOW_107,
    WORKFLOW_108,
    WORKFLOW_109,
    WORKFLOW_110;
    
    private final String value;
    
    DiagnosticCode() {
        this.value = this.name();
    }
    
    public String getValue() {
        return value;
    }
}
