require_relative '../spec_helper'

module MobileESPConverted
  class UAgentInfoSpec < MiniTest::Spec
    describe UAgentInfo do
      it "categorizes iPhone/Safari" do
        uai = UAgentInfo.new("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7", "text/html")
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
        uai = UAgentInfo.new("Mozilla/5.0 (iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10", "text/html")
        uai.is_tier_tablet.must_equal true
        # strangely, MobileESP categorizes iPad UA into 'tier_iphone' as well as 'tier_tablet'
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal true
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end

      it "categorizes Android phone / Android Browser" do
        # UA string for Google Nexus S
        uai = UAgentInfo.new("Mozilla/5.0 (Linux; U; Android 2.3.4; fr-fr; Nexus S Build/GRJ22) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1", "text/html")
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
        uai = UAgentInfo.new("Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13", "text/html")
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
        uai = UAgentInfo.new("Opera/9.80 (Android 2.2.2; Linux; Opera Mobi/ADR-1202231246; U; en) Presto/2.10.254 Version/12.00", "text/html")
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
        uai = UAgentInfo.new("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11", "text/html")
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
        uai = UAgentInfo.new("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7)", "text/html")
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
        uai = UAgentInfo.new("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; de-at) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1", "text/html")
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
        uai.detect_iphone.must_equal false
        uai.detect_ipad.must_equal false
        uai.detect_android_phone.must_equal false
        uai.detect_android_tablet.must_equal false
      end
    end
  end
end
