require 'selenium-webdriver'

class BBCLogin

    Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'

    @driver = Selenium::WebDriver.for :chrome

    def self.get_website
        @driver.get('http://www.bbc.co.uk')
    end

    def self.login_link
        @driver.find_element(:id, "idcta-link").click
    end

    def self.username_input(input)
        @driver.find_element(:id, "username-input").send_keys("#{input}")
    end
    
    def self.password_input(password)
        @driver.find_element(:id, "password-input").send_keys("#{password}")
    end

    def self.submit
        @driver.find_element(:id, "submit-button").click
    end

    def self.authenticate_username_error
        @driver.find_element(:id, "form-error-username")
    end

    def self.clear_username_input
        @driver.find_element(:id, "username-input").clear
    end

    def self.run
        self.get_website
        sleep(2)
        self.login_link
        sleep(2)
        self.username_input("sfsdgdh")
        sleep(2)
        self.password_input("safjashdfuahskdjfa")
        sleep(2)
        self.submit
        sleep(2)
        self.authenticate_username_error
        sleep(2)
        self.clear_username_input
        sleep(2)
        self.username_input("bbc-jennyejohnson94@gmail.com")
        sleep(2)
        self.password_input("password1234")
        sleep(2)
        self.submit
        sleep(10)
    end
end

BBCLogin.run