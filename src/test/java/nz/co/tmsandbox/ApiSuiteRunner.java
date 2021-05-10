package nz.co.tmsandbox;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

/**
 * Run all tests in parallel threads
 *
 * @author Aruna Halviti
 */
class ApiSuiteRunner {
    /**
     * Generate cucumber reports
     *
     * @param karateOutputPath String junit test files
     */
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "TradeMe Sandbox API Tests");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    /**
     * Run all tests in parallel
     */
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:nz/co/tmsandbox")
                .tags("~@ignore")
                .timeoutMinutes(60)
                .outputCucumberJson(true)
                .outputJunitXml(true)
                .outputHtmlReport(true)
                .reportDir("target/test-reports")
                .parallel(Integer.parseInt(System.getProperty("Threads", "5")));
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
