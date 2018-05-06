package com.example.tests;

import java.util.concurrent.TimeUnit;
import org.junit.After;
import static org.junit.Assert.fail;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.remote.DesiredCapabilities;

public class UntitledTestCase {

    private WebDriver driver;
    private String baseUrl;
    private boolean acceptNextAlert = true;
    private final StringBuffer verificationErrors = new StringBuffer();
    FirefoxOptions options = new FirefoxOptions();

    @Before
    public void setUp() throws Exception {
        options.setBinary("C:\\Program Files\\Mozilla Firefox\\firefox.exe");
        DesiredCapabilities capabilities = DesiredCapabilities.firefox();
//        capabilities.setCapability("moz:firefoxOptions", options);
        driver = new FirefoxDriver(options);
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    }

    @Test
    public void testUntitledTestCase() throws Exception {
        driver.get("http://localhost:8084/RecommenderApplication/index.jsp");
        driver.findElement(By.id("email_field")).click();
        driver.findElement(By.id("email_field")).clear();
        driver.findElement(By.id("email_field")).sendKeys("hrajpal96@gmail.com");
        driver.findElement(By.id("Pass")).clear();
        driver.findElement(By.id("Pass")).sendKeys("Scarface964@");
        driver.findElement(By.id("loginform")).submit();
        driver.findElement(By.id("showrecommendations")).click();
        driver.findElement(By.linkText("keyboard_tabLogout")).click();
    }

    @After
    public void tearDown() throws Exception {
        driver.quit();
        String verificationErrorString = verificationErrors.toString();
        if (!"".equals(verificationErrorString)) {
            fail(verificationErrorString);
        }
    }

    private boolean isElementPresent(By by) {
        try {
            driver.findElement(by);
            return true;
        } catch (NoSuchElementException e) {
            return false;
        }
    }

    private boolean isAlertPresent() {
        try {
            driver.switchTo().alert();
            return true;
        } catch (NoAlertPresentException e) {
            return false;
        }
    }

    private String closeAlertAndGetItsText() {
        try {
            Alert alert = driver.switchTo().alert();
            String alertText = alert.getText();
            if (acceptNextAlert) {
                alert.accept();
            } else {
                alert.dismiss();
            }
            return alertText;
        } finally {
            acceptNextAlert = true;
        }
    }
}
