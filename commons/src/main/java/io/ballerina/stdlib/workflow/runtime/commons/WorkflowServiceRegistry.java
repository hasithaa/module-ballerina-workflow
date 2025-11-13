/*
 *  Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
 *
 *  WSO2 LLC. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package io.ballerina.stdlib.workflow.runtime.commons;

import io.ballerina.runtime.api.values.BObject;
import io.ballerina.stdlib.workflow.runtime.commons.model.WorkflowService;

import java.util.HashMap;
import java.util.Map;

/**
 * Registry for managing workflow services by provider.
 *
 * @since 0.1.0
 */
public class WorkflowServiceRegistry {

    private static final Map<String, WorkflowServiceRegistry> serviceRegistryMap = new HashMap<>();

    private final Map<String, WorkflowService> workflowServiceMap = new HashMap<>();

    private WorkflowServiceRegistry() {
    }

    /**
     * Gets or creates a WorkflowServiceRegistry instance for the specified provider.
     *
     * @param provider the provider name
     * @return the WorkflowServiceRegistry instance for the provider
     * @since 0.1.0
     */
    public static WorkflowServiceRegistry getInstance(String provider) {
        return serviceRegistryMap.computeIfAbsent(provider, k -> new WorkflowServiceRegistry());
    }

    /**
     * Registers a workflow service with the given name.
     *
     * @param workflowName the name of the workflow
     * @param service the workflow service to register
     * @since 0.1.0
     */
    public void registerWorkflow(String workflowName, WorkflowService service) {
        workflowServiceMap.put(workflowName, service);
    }

    /**
     * Unregisters a workflow service by its service object.
     *
     * @param svc the Ballerina service object to unregister
     * @since 0.1.0
     */
    public void unregisterWorkflow(BObject svc) {
        workflowServiceMap.values().removeIf(wsvc -> wsvc.serviceObject().equals(svc));
    }
}
