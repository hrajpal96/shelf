package com.example.tests;

import com.thoughtworks.selenium.Selenium;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.WebDriver;
import com.thoughtworks.selenium.webdriven.WebDriverBackedSelenium;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class RateItemTest {
	private Selenium selenium;

	@Before
	public void setUp() throws Exception {
		WebDriver driver = new FirefoxDriver();
		String baseUrl = "https://www.katalon.com/";
		selenium = new WebDriverBackedSelenium(driver, baseUrl);
	}

	@Test
	public void testRateItem() throws Exception {
		selenium.open("http://localhost:8084/RecommenderApplication/index.jsp");
		selenium.click("id=email_field");
		selenium.type("id=email_field", "hrajpal96@gmail.com");
		selenium.click("//form[@id='loginform']/div[3]/div/label");
		selenium.type("id=Pass", "Scarface964@");
		selenium.click("name=btn_login");
		selenium.click("id=showrecommendations");
		selenium.click("xpath=(//a[contains(text(),'View Details')])[2]");
		selenium.click("name=action");
		selenium.click("link=keyboard_tabLogout");
	}

	@After
	public void tearDown() throws Exception {
		selenium.stop();
	}
}
