import ballerina/test;

@test:Config
function testModel() returns error? {
    
    Activities workflowModelActivities = check mockProvider.getWorkflowModelActivities("testWorkflow");
    test:assertEquals(workflowModelActivities.length(), 2, "Workflow model activities length mismatch");
    
    WorkflowModelDetails workflowModelDetails = check mockProvider.getWorkflowModelDetails("testWorkflow");
    test:assertEquals(workflowModelDetails.queries.length(), 3, "Workflow model queries length mismatch");
    test:assertEquals(workflowModelDetails.signals.length(), 2, "Workflow model signals length mismatch");
}