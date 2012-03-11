require_relative '../spec_helper'

module MobileESPConverted
  class UAgentInfoSpec < MiniTest::Spec
    describe UAgentInfo do
      it "categorizes iPhone/Safari" do
        uai = UAgentInfo.new("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7", "text/html")
        uai.is_iphone.must_equal true
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes iPad/Safari" do
        uai = UAgentInfo.new("", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal true
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Android phone / Android Browser" do
        uai = UAgentInfo.new("", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal true
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Android tablet / Android Browser" do
        uai = UAgentInfo.new("Mozilla/5.0 (Linux; U; Android 3.0; xx-xx; Xoom Build/HRI39) AppleWebKit/525.10+ (KHTML, like Gecko) Version/3.0.4 Mobile Safari/523.12.2", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal true
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Android / Opera Mobile" do
        uai = UAgentInfo.new("", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal true
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Linux/Chrome" do
        uai = UAgentInfo.new("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Windows/IE" do
        uai = UAgentInfo.new("", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end

      it "categorizes Mac/Safari" do
        uai = UAgentInfo.new("", "text/html")
        uai.is_iphone.must_equal false
        uai.is_android_phone.must_equal false
        uai.is_tier_tablet.must_equal false
        uai.is_tier_iphone.must_equal false
        uai.is_tier_rich_css.must_equal false
        uai.is_tier_generic_mobile.must_equal false
      end
    end
  end
end
