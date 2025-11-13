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

package io.ballerina.stdlib.workflow.compiler.util;

import io.ballerina.projects.DiagnosticResult;
import io.ballerina.stdlib.workflow.compiler.diagnostics.WorkflowDiagnostic;
import io.ballerina.tools.diagnostics.Diagnostic;
import io.ballerina.tools.diagnostics.DiagnosticSeverity;
import org.testng.Assert;

/**
 * Util methods used for assertions in workflow compiler plugin tests.
 *
 * @since 0.1.0
 */
public class WorkFlowAssertUtil {
    private static final String CARRIAGE_RETURN_CHAR = "\\r";
    private static final String EMPTY_STRING = "";

    /**
     * Assert an error.
     *
     * @param result          Result from compilation
     * @param index           Index of the error in the result
     * @param expectedErrMsg  Expected error message
     * @param code            Expected diagnostic code
     * @param expectedErrLine Expected line number of the error
     * @param expectedErrCol  Expected column number of the error
     */
    public static void assertError(DiagnosticResult result, int index, String expectedErrMsg, WorkflowDiagnostic code,
                                   int expectedErrLine, int expectedErrCol) {
        Diagnostic diagnostic = (Diagnostic) result.errors().toArray()[index];
        Assert.assertEquals(diagnostic.diagnosticInfo().severity(), DiagnosticSeverity.ERROR,
                "incorrect diagnostic type");
        Assert.assertEquals(diagnostic.message().replace(CARRIAGE_RETURN_CHAR, EMPTY_STRING),
                expectedErrMsg.replace(CARRIAGE_RETURN_CHAR, EMPTY_STRING), "incorrect error message:");
        Assert.assertEquals(diagnostic.location().lineRange().startLine().line() + 1, expectedErrLine,
                "incorrect line number:");
        Assert.assertEquals(diagnostic.location().lineRange().startLine().offset() + 1, expectedErrCol,
                "incorrect column position:");
        if (code != null) {
            Assert.assertEquals(diagnostic.diagnosticInfo().code(), code.getCode());
        }
    }
}
