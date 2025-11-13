import workflow.internal;

isolated class MockProvider {

    *PersistentProvider;
    private final map<[WorkflowModelDetails, Activities]> workflowModels = {};

    public isolated function init() {
    }

    public isolated function getClient() returns WorkflowEngineClient|error {
        return new MockWorkflowClient();
    }

    public isolated function getWorkflowOperators() returns WorkflowOperators|error {
        return new MockWorkflowOperators();
    }

    public isolated function registerWorkflowModel(WorkflowModel svc, WorkflowModelDetails details, string workflowName, Activities activities) returns error? {
        lock {
            self.workflowModels[workflowName] = [details.cloneReadOnly(), activities.cloneReadOnly()];
        }
        return;
    }

    public isolated function 'start() returns error? {
        return;
    }

    public isolated function stop() returns error? {
        return;
    }

    public isolated function unregisterWorkflowModel(WorkflowModel svc) returns error? {
        return;
    }

    public isolated function getWorkflowModelDetails(string workflowName) returns WorkflowModelDetails|error {
        lock {
            return self.workflowModels.get(workflowName)[0].cloneReadOnly();
        }
    }

    public isolated function getWorkflowModelActivities(string workflowName) returns Activities|error {
        lock {
            return self.workflowModels.get(workflowName)[1].cloneReadOnly();
        }
    }
}

isolated client class MockWorkflowClient {
    *WorkflowEngineClient;

    isolated remote function callActivity(function acticity, anydata... args) returns anydata|error {
        return;
    }

    isolated remote function execute(WorkflowModel svc, anydata... args) returns Execution|error {
        return {
            id: "mock-execution-id"
        };
    }

    isolated remote function query(WorkflowModel svc, Execution execution, string queryName, anydata... args) returns anydata|error {
        return;
    }

    isolated remote function signal(WorkflowModel svc, Execution execution, string signalName, anydata... args) returns error? {
        return;
    }
}

isolated client class MockWorkflowOperators {
    *WorkflowOperators;

    isolated remote function await(boolean conditionFunc) returns NotInWorkflowError|error? {
        return;
    }

    isolated remote function sleep(Duration duration) returns NotInWorkflowError|error? {
        return;
    }
}

final MockProvider mockProvider = new MockProvider();
listener WorkflowEventListener workflowListener = new WorkflowEventListener(mockProvider);

@internal:__WorkflowActivities {
    "testActivity1": testActivity1,
    "testActivity2": testActivity2
}
service "testWorkflow" on workflowListener {

    remote function execute() {
        _ = testActivity1(); // workflow:CallActivity(testActivity1, params...);
        _ = testActivity2("hello");
    }

    @Signal
    remote function onSignal1() {

    }

    @Signal
    remote function onSignal2(string msg) {

    }

    @Query
    remote function onQuery1() returns string {
        return "query-response";
    }

    @Query
    remote function onQuery2(int id) returns int {
        return id * 2;
    }

    @Query
    remote function onQuery3(string name, int age) returns string {
        return name + ":" + age.toString();
    }
}

@Activity
isolated function testActivity1() returns string {
    return "activity1-result";
}

@Activity
isolated function testActivity2(string msg) returns string {
    return msg;
}
