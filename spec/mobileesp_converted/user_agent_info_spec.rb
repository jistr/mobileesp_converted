require_relative '../spec_helper'

module MobileESPConverted
  class UserAgentInfoSpec < MiniTest::Spec
    describe UserAgentInfo do
      it "categorizes iPhone/Safari" do
        uai = UserAgentInfo.new("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal true
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes iPad/Safari" do
        uai = UserAgentInfo.new("Mozilla/5.0 (iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10", "text/html")
        uai.detect_ipad.must_equal true
        uai.is_iphone.must_equal false
        uai.is_tier_tablet.must_equal true
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal true
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Android phone / Android Browser" do
        # UA string for Google Nexus S
        uai = UserAgentInfo.new("Mozilla/5.0 (Linux; U; Android 2.3.4; fr-fr; Nexus S Build/GRJ22) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal true
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Android 4 phone / Custom Android Browser" do
        # UA string for Xiaomi Hongmi (Red Rice)
        uai = UserAgentInfo.new("Mozilla/5.0 (Linux; U; Android 4.2.1; ru-ru; HM2013023 Build/JOP40D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 XiaoMi/MiuiBrowser/1.0", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal true
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Android tablet / Android Browser" do
        # UA string for Motorola Xoom
        uai = UserAgentInfo.new("Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13", "text/html")
        uai.is_tier_tablet.must_equal true
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal true
      end

      it "categorizes Android tablet / Chrome Browser" do
        # UA string for Chrome on Pipo M9 Pro
        uai = UserAgentInfo.new("Mozilla/5.0 (Linux; Android 4.2.2; M9pro Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.59 Safari/537.36", "text/html")
        uai.is_tier_tablet.must_equal true
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal true
      end

      it "categorizes Android / Opera Mobile" do
        # Opera Mobile 12
        uai = UserAgentInfo.new("Opera/9.80 (Android 2.2.2; Linux; Opera Mobi/ADR-1202231246; U; en) Presto/2.10.254 Version/12.00", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_opera_mobile.must_equal true
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal true
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Linux/Chrome" do
        uai = UserAgentInfo.new("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Windows/IE" do
        # IE 9 on Windows 7
        uai = UserAgentInfo.new("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7)", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Mac/Safari" do
        # Safari 5 on Snow Leopard
        uai = UserAgentInfo.new("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; de-at) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      # categorization according to original MobileESP implementation
      it "categorizes Kindle Fire" do
        uai = UserAgentInfo.new("Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal true
        uai.detect_android_tablet.must_equal false
      end

      # categorization according to original MobileESP implementation
      it "categorizes Kindle Fire silk mode" do
        uai = UserAgentInfo.new("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us; Silk/1.1.0-80) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16 Silk-Accelerated=true", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal true
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end
    end
  end
end
