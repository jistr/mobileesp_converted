# This file has been automatically converted to Ruby from Java source code.
#
#
#
=begin
 *******************************************
# Copyright 2010-2012, Anthony Hand
#
# File version date: April 23, 2012
#        Update:
#        - Updated DetectAmazonSilk(): Fixed an issue in the detection logic.
#
# File version date: April 22, 2012 - Second update
#        Update: To address additional Kindle issues...
#        - Updated DetectRichCSS(): Excluded e-Ink Kindle devices.
#        - Created DetectAmazonSilk(): Created to detect Kindle Fire devices in Silk mode.
#        - Updated DetectMobileQuick(): Updated to include e-Ink Kindle devices and the Kindle Fire in Silk mode.
#
# File version date: April 11, 2012
#        Update:
#        - Added a new variable for the new BlackBerry Curve Touch (9380): deviceBBCurveTouch.
#        - Updated DetectBlackBerryTouch() to support the new BlackBerry Curve Touch (9380).
#
# File version date: January 21, 2012
#        Update:
#        - Moved Windows Phone 7 to the iPhone Tier. WP7.5's IE 9-based browser is good enough now.
#        - Added a new variable for 2 versions of the new BlackBerry Bold Touch (9900 and 9930): deviceBBBoldTouch.
#        - Updated DetectBlackBerryTouch() to support the 2 versions of the new BlackBerry Bold Touch (9900 and 9930).
#        - Updated DetectKindle() to focus on eInk devices only. The Kindle Fire should be detected as a regular Android device.
#
# File version date: August 22, 2011
#        Update:
#        - Updated DetectAndroidTablet() to fix a bug I introduced in the last fix!
#
# File version date: August 16, 2011
#        Update:
#        - Updated DetectAndroidTablet() to exclude Opera Mini, which was falsely reporting as running on a tablet device when on a phone.
#
#
# LICENSE INFORMATION
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#        http:
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#
#
# ABOUT THIS PROJECT
#   Project Owner: Anthony Hand
#   Email: anthony.hand@gmail.com
#   Web Site: http:
#   Source Files: http:
#
#   Versions of this code are available for:
#      PHP, JavaScript, Java, ASP.NET (C#), and Ruby
#
# *******************************************

=end


=begin
*
 * The DetectSmartPhone class encapsulates information about
 *   a browser's connection to your web site.
 *   You can use it to find out whether the browser asking for
 *   your site's content is probably running on a mobile device.
 *   The methods were written so you can be as granular as you want.
 *   For example, enquiring whether it's as specific as an iPod Touch or
 *   as general as a smartphone class device.
 *   The object's methods return true, or false.

=end
module MobileESPConverted
  class UserAgentInfo


    attr_reader :user_agent
    attr_reader :http_accept


    attr_reader :is_iphone
    attr_reader :is_android_phone
    attr_reader :is_tier_tablet
    attr_reader :is_tier_iphone
    attr_reader :is_tier_rich_css
    attr_reader :is_tier_generic_mobile


    ENGINE_WEB_KIT = "webkit"

    DEVICE_IPHONE = "iphone"
    DEVICE_IPOD = "ipod"
    DEVICE_IPAD = "ipad"
    DEVICE_MAC_PPC = "macintosh"

    DEVICE_ANDROID = "android"
    DEVICE_GOOGLE_T_V = "googletv"
    DEVICE_XOOM = "xoom"
    DEVICE_HTC_FLYER = "htc_flyer"

    DEVICE_SYMBIAN = "symbian"
    DEVICE_S60 = "series60"
    DEVICE_S70 = "series70"
    DEVICE_S80 = "series80"
    DEVICE_S90 = "series90"

    DEVICE_WIN_PHONE7 = "windows phone os 7"
    DEVICE_WIN_MOB = "windows ce"
    DEVICE_WINDOWS = "windows"
    DEVICE_IE_MOB = "iemobile"
    DEVICE_PPC = "ppc"
    ENGINE_PIE = "wm5 pie"

    DEVICE_B_B = "blackberry"
    VND_R_I_M = "vnd.rim"
    DEVICE_B_B_STORM = "blackberry95"
    DEVICE_B_B_BOLD = "blackberry97"
    DEVICE_B_B_BOLD_TOUCH = "blackberry 99"
    DEVICE_B_B_TOUR = "blackberry96"
    DEVICE_B_B_CURVE = "blackberry89"
    DEVICE_B_B_CURVE_TOUCH = "blackberry 938"
    DEVICE_B_B_TORCH = "blackberry 98"
    DEVICE_B_B_PLAYBOOK = "playbook"

    DEVICE_PALM = "palm"
    DEVICE_WEB_O_S = "webos"
    DEVICE_WEB_O_SHP = "hpwos"

    ENGINE_BLAZER = "blazer"
    ENGINE_XIINO = "xiino"

    DEVICE_KINDLE = "kindle"
    ENGINE_SILK = "silk"

    DEVICE_NUVIFONE = "nuvifone"


    VNDWAP = "vnd.wap"
    WML = "wml"


    DEVICE_TABLET = "tablet"
    DEVICE_BREW = "brew"
    DEVICE_DANGER = "danger"
    DEVICE_HIPTOP = "hiptop"
    DEVICE_PLAYSTATION = "playstation"
    DEVICE_NINTENDO_DS = "nitro"
    DEVICE_NINTENDO = "nintendo"
    DEVICE_WII = "wii"
    DEVICE_XBOX = "xbox"
    DEVICE_ARCHOS = "archos"

    ENGINE_OPERA = "opera"
    ENGINE_NETFRONT = "netfront"
    ENGINE_UP_BROWSER = "up.browser"
    ENGINE_OPEN_WEB = "openweb"
    DEVICE_MIDP = "midp"
    UPLINK = "up.link"
    ENGINE_TELECA_Q = "teleca q"
    DEVICE_PDA = "pda"
    MINI = "mini"
    MOBILE = "mobile"
    MOBI = "mobi"


    MAEMO = "maemo"
    LINUX = "linux"
    QTEMBEDDED = "qt embedded"
    MYLOCOM2 = "com2"


    MANU_SONY_ERICSSON = "sonyericsson"
    MANUERICSSON = "ericsson"
    MANU_SAMSUNG1 = "sec-sgh"
    MANU_SONY = "sony"
    MANU_HTC = "htc"


    SVC_DOCOMO = "docomo"
    SVC_KDDI = "kddi"
    SVC_VODAFONE = "vodafone"


    DIS_UPDATE = "update"


=begin
*
     * Initialize the user_agent and http_accept variables
     *
     * @param user_agent the User-Agent header
     * @param http_accept the Accept header

=end
    def initialize(user_agent, http_accept)
      if (user_agent != nil)
        @user_agent = user_agent.downcase
      end
      if (http_accept != nil)
        @http_accept = http_accept.downcase
      end


      init_device_scan()
    end

=begin
*
     * Return the lower case HTTP_USER_AGENT
     * @return user_agent

=end
    def get_user_agent()
      return user_agent
    end

=begin
*
     * Return the lower case HTTP_ACCEPT
     * @return http_accept

=end
    def get_http_accept()
      return http_accept
    end

=begin
*
     * Return whether the device is an Iphone or iPod Touch
     * @return is_iphone

=end
    def get_is_iphone()
      return is_iphone
    end

=begin
*
     * Return whether the device is in the Tablet Tier.
     * @return is_tier_tablet

=end
    def get_is_tier_tablet()
      return is_tier_tablet
    end

=begin
*
     * Return whether the device is in the Iphone Tier.
     * @return is_tier_iphone

=end
    def get_is_tier_iphone()
      return is_tier_iphone
    end

=begin
*
     * Return whether the device is in the 'Rich CSS' tier of mobile devices.
     * @return is_tier_rich_css

=end
    def get_is_tier_rich_css()
      return is_tier_rich_css
    end

=begin
*
     * Return whether the device is a generic, less-capable mobile device.
     * @return is_tier_generic_mobile

=end
    def get_is_tier_generic_mobile()
      return is_tier_generic_mobile
    end

=begin
*
     * Initialize Key Stored Values.

=end
    def init_device_scan()
      @is_iphone = detect_iphone_or_ipod()
      @is_android_phone = detect_android_phone()
      @is_tier_tablet = detect_tier_tablet()
      @is_tier_iphone = detect_tier_iphone()
      @is_tier_rich_css = detect_tier_rich_css()
      @is_tier_generic_mobile = detect_tier_other_phones()
    end

=begin
*
     * Detects if the current device is an iPhone.
     * @return detection of an iPhone

=end
    def detect_iphone()

      if (user_agent.include?(DEVICE_IPHONE) &&
          !detect_ipad() &&
          !detect_ipod())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an iPod Touch.
     * @return detection of an iPod Touch

=end
    def detect_ipod()
      if (user_agent.include?(DEVICE_IPOD))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an iPad tablet.
     * @return detection of an iPad

=end
    def detect_ipad()
      if (user_agent.include?(DEVICE_IPAD) && detect_webkit())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an iPhone or iPod Touch.
     * @return detection of an iPhone or iPod Touch

=end
    def detect_iphone_or_ipod()

      if (detect_iphone() || user_agent.include?(DEVICE_IPOD))
        return true
      end
      return false
    end

=begin
*
     * Detects *any* iOS device: iPhone, iPod Touch, iPad.
     * @return detection of an Apple iOS device

=end
    def detect_ios()
      if (detect_iphone_or_ipod() || detect_ipad())
        return true
      end
      return false
    end


=begin
*
     * Detects *any* Android OS-based device: phone, tablet, and multi-media player.
     * Also detects Google TV.
     * @return detection of an Android device

=end
    def detect_android()
      if ((user_agent.include?(DEVICE_ANDROID)) ||
          detect_google_t_v())
        return true
      end

      if (user_agent.include?(DEVICE_HTC_FLYER))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is a (small-ish) Android OS-based device
     * used for calling and/or multi-media (like a Samsung Galaxy Player).
     * Google says these devices will have 'Android' AND 'mobile' in user agent.
     * Ignores tablets (Honeycomb and later).
     * @return  detection of an Android phone

=end
    def detect_android_phone()
      if (detect_android() && (user_agent.include?(MOBILE)))
        return true
      end

      if (detect_opera_android_phone())
        return true
      end

      if (user_agent.include?(DEVICE_HTC_FLYER))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is a (self-reported) Android tablet.
     * Google says these devices will have 'Android' and NOT 'mobile' in their user agent.
     * @return detection of an Android tablet

=end
    def detect_android_tablet()

      if (!detect_android())
        return false
      end


      if (detect_opera_mobile())
        return false
      end

      if (user_agent.include?(DEVICE_HTC_FLYER))
        return false
      end


      if ((user_agent.include?(MOBILE)))
        return false
      else
        return true
      end
    end

=begin
*
     * Detects if the current device is an Android OS-based device and
     * the browser is based on WebKit.
     * @return detection of an Android WebKit browser

=end
    def detect_android_web_kit()
      if (detect_android() && detect_webkit())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is a GoogleTV.
     * @return detection of GoogleTV

=end
    def detect_google_t_v()
      if (user_agent.include?(DEVICE_GOOGLE_T_V))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is based on WebKit.
     * @return detection of a WebKit browser

=end
    def detect_webkit()
      if (user_agent.include?(ENGINE_WEB_KIT))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is the Symbian S60 Open Source Browser.
     * @return detection of Symbian S60 Browser

=end
    def detect_s60_oss_browser()

      if (detect_webkit() && (user_agent.include?(DEVICE_SYMBIAN) || user_agent.include?(DEVICE_S60)))
        return true
      end
      return false
    end

=begin
*
     *
     * Detects if the current device is any Symbian OS-based device,
     *   including older S60, Series 70, Series 80, Series 90, and UIQ,
     *   or other browsers running on these devices.
     * @return detection of SymbianOS

=end
    def detect_symbian_o_s()
      if (user_agent.include?(DEVICE_SYMBIAN) || user_agent.include?(DEVICE_S60) || user_agent.include?(DEVICE_S70) || user_agent.include?(DEVICE_S80) || user_agent.include?(DEVICE_S90))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a
     * Windows Phone 7 device.
     * @return detection of Windows Phone 7

=end
    def detect_windows_phone7()
      if (user_agent.include?(DEVICE_WIN_PHONE7))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a Windows Mobile device.
     * Excludes Windows Phone 7 devices.
     * Focuses on Windows Mobile 6.xx and earlier.
     * @return detection of Windows Mobile

=end
    def detect_windows_mobile()

      if (detect_windows_phone7())
        return false
      end



      if (user_agent.include?(DEVICE_WIN_MOB) || user_agent.include?(DEVICE_WIN_MOB) || user_agent.include?(DEVICE_IE_MOB) || user_agent.include?(ENGINE_PIE) || (user_agent.include?(MANU_HTC) && user_agent.include?(DEVICE_WINDOWS)) || (detect_wap_wml() && user_agent.include?(DEVICE_WINDOWS)))
        return true
      end


      if (user_agent.include?(DEVICE_PPC) &&
          !(user_agent.include?(DEVICE_MAC_PPC)))
        return true
      end

      return false
    end

=begin
*
     * Detects if the current browser is any BlackBerry.
     * Includes the PlayBook.
     * @return detection of Blackberry

=end
    def detect_black_berry()
      if (user_agent.include?(DEVICE_B_B) ||
          http_accept.include?(VND_R_I_M))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is on a BlackBerry tablet device.
     *    Example: PlayBook
     * @return detection of a Blackberry Tablet

=end
    def detect_black_berry_tablet()
      if (user_agent.include?(DEVICE_B_B_PLAYBOOK))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a BlackBerry device AND uses a
     *    WebKit-based browser. These are signatures for the new BlackBerry OS 6.
     *    Examples: Torch. Includes the Playbook.
     * @return detection of a Blackberry device with WebKit browser

=end
    def detect_black_berry_web_kit()
      if (detect_black_berry() &&
          user_agent.include?(ENGINE_WEB_KIT))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a BlackBerry Touch
     * device, such as the Storm, Torch, and Bold Touch. Excludes the Playbook.
     * @return detection of a Blackberry touchscreen device

=end
    def detect_black_berry_touch()
      if (detect_black_berry() &&
          (user_agent.include?(DEVICE_B_B_STORM) ||
           user_agent.include?(DEVICE_B_B_TORCH) ||
           user_agent.include?(DEVICE_B_B_BOLD_TOUCH) ||
           user_agent.include?(DEVICE_B_B_CURVE_TOUCH) ))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a BlackBerry device AND
     *   has a more capable recent browser. Excludes the Playbook.
     *   Examples, Storm, Bold, Tour, Curve2
     *   Excludes the new BlackBerry OS 6 and 7 browser!!
     * @return detection of a Blackberry device with a better browser

=end
    def detect_black_berry_high()

      if (detect_black_berry_web_kit())
        return false
      end
      if (detect_black_berry())
        if (detect_black_berry_touch() || user_agent.include?(DEVICE_B_B_BOLD) || user_agent.include?(DEVICE_B_B_TOUR) || user_agent.include?(DEVICE_B_B_CURVE))
          return true
        else
          return false
        end
      else
        return false
      end
    end

=begin
*
     * Detects if the current browser is a BlackBerry device AND
     *   has an older, less capable browser.
     *   Examples: Pearl, 8800, Curve1
     * @return detection of a Blackberry device with a poorer browser

=end
    def detect_black_berry_low()
      if (detect_black_berry())

        if (detect_black_berry_high() || detect_black_berry_web_kit())
          return false
        else
          return true
        end
      else
        return false
      end
    end

=begin
*
     * Detects if the current browser is on a PalmOS device.
     * @return detection of a PalmOS device

=end
    def detect_palm_o_s()

      if (user_agent.include?(DEVICE_PALM) || user_agent.include?(ENGINE_BLAZER) || user_agent.include?(ENGINE_XIINO))

        if (detect_palm_web_o_s())
          return false
        else
          return true
        end
      end
      return false
    end

=begin
*
     * Detects if the current browser is on a Palm device
     *    running the new WebOS.
     * @return detection of a Palm WebOS device

=end
    def detect_palm_web_o_s()
      if (user_agent.include?(DEVICE_WEB_O_S))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is on an HP tablet running WebOS.
     * @return detection of an HP WebOS tablet

=end
    def detect_web_o_s_tablet()
      if (user_agent.include?(DEVICE_WEB_O_SHP) &&
          user_agent.include?(DEVICE_TABLET))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a
     *    Garmin Nuvifone.
     * @return detection of a Garmin Nuvifone

=end
    def detect_garmin_nuvifone()
      if (user_agent.include?(DEVICE_NUVIFONE))
        return true
      end
      return false
    end

=begin
*
     * Check to see whether the device is any device
     *   in the 'smartphone' category.
     * @return detection of a general smartphone device

=end
    def detect_smartphone()
      return (is_iphone || is_android_phone || is_tier_iphone || detect_s60_oss_browser() || detect_symbian_o_s() || detect_windows_mobile() || detect_windows_phone7() || detect_black_berry() || detect_palm_web_o_s() || detect_palm_o_s() || detect_garmin_nuvifone())
    end

=begin
*
     * Detects whether the device is a Brew-powered device.
     * @return detection of a Brew device

=end
    def detect_brew_device()
      if (user_agent.include?(DEVICE_BREW))
        return true
      end
      return false
    end

=begin
*
     * Detects the Danger Hiptop device.
     * @return detection of a Danger Hiptop

=end
    def detect_danger_hiptop()
      if (user_agent.include?(DEVICE_DANGER) || user_agent.include?(DEVICE_HIPTOP))
        return true
      end
      return false
    end

=begin
*
     * Detects Opera Mobile or Opera Mini.
     * @return detection of an Opera browser for a mobile device

=end
    def detect_opera_mobile()
      if (user_agent.include?(ENGINE_OPERA) && (user_agent.include?(MINI) || user_agent.include?(MOBI)))
        return true
      end
      return false
    end

=begin
*
     * Detects Opera Mobile on an Android phone.
     * @return detection of an Opera browser on an Android phone

=end
    def detect_opera_android_phone()
      if (user_agent.include?(ENGINE_OPERA) && (user_agent.include?(DEVICE_ANDROID) && user_agent.include?(MOBI)))
        return true
      end
      return false
    end

=begin
*
     * Detects Opera Mobile on an Android tablet.
     * @return detection of an Opera browser on an Android tablet

=end
    def detect_opera_android_tablet()
      if (user_agent.include?(ENGINE_OPERA) && (user_agent.include?(DEVICE_ANDROID) && user_agent.include?(DEVICE_TABLET)))
        return true
      end
      return false
    end

=begin
*
     * Detects whether the device supports WAP or WML.
     * @return detection of a WAP- or WML-capable device

=end
    def detect_wap_wml()
      if (http_accept.include?(VNDWAP) || http_accept.include?(WML))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an Amazon Kindle (eInk devices only).
     * Note: For the Kindle Fire, use the normal Android methods.
     * @return detection of a Kindle

=end
    def detect_kindle()
      if (user_agent.include?(DEVICE_KINDLE) &&
          !detect_android())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current Amazon device is using the Silk Browser.
     * Note: Typically used by the the Kindle Fire.
     * @return detection of an Amazon Kindle Fire in Silk mode.

=end
    def detect_amazon_silk()
      if (user_agent.include?(ENGINE_SILK))
        return true
      end
      return false
    end

=begin
*
     *    Detects if the current device is a mobile device.
     *  This method catches most of the popular modern devices.
     *  Excludes Apple iPads and other modern tablets.
     * @return detection of any mobile device using the quicker method

=end
    def detect_mobile_quick()

      if (is_tier_tablet)
        return false
      end

      if (detect_smartphone())
        return true
      end

      if (detect_wap_wml() || detect_brew_device() || detect_opera_mobile())
        return true
      end

      if ((user_agent.include?(ENGINE_NETFRONT)) || (user_agent.include?(ENGINE_UP_BROWSER)) || (user_agent.include?(ENGINE_OPEN_WEB)))
        return true
      end

      if (detect_danger_hiptop() || detect_midp_capable() || detect_maemo_tablet() || detect_archos())
        return true
      end

      if ((user_agent.include?(DEVICE_PDA)) &&
          (!user_agent.include?(DIS_UPDATE)))
        return true
      end
      if (user_agent.include?(MOBILE))
        return true
      end


      if (detect_kindle() || detect_amazon_silk())
        return true
      end

      return false
    end

=begin
*
     * Detects if the current device is a Sony Playstation.
     * @return detection of Sony Playstation

=end
    def detect_sony_playstation()
      if (user_agent.include?(DEVICE_PLAYSTATION))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is a Nintendo game device.
     * @return detection of Nintendo

=end
    def detect_nintendo()
      if (user_agent.include?(DEVICE_NINTENDO) || user_agent.include?(DEVICE_WII) || user_agent.include?(DEVICE_NINTENDO_DS))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is a Microsoft Xbox.
     * @return detection of Xbox

=end
    def detect_xbox()
      if (user_agent.include?(DEVICE_XBOX))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an Internet-capable game console.
     * @return detection of any Game Console

=end
    def detect_game_console()
      if (detect_sony_playstation() || detect_nintendo() || detect_xbox())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device supports MIDP, a mobile Java technology.
     * @return detection of a MIDP mobile Java-capable device

=end
    def detect_midp_capable()
      if (user_agent.include?(DEVICE_MIDP) || http_accept.include?(DEVICE_MIDP))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is on one of the Maemo-based Nokia Internet Tablets.
     * @return detection of a Maemo OS tablet

=end
    def detect_maemo_tablet()
      if (user_agent.include?(MAEMO))
        return true
      elsif (user_agent.include?(LINUX) && user_agent.include?(DEVICE_TABLET) && !detect_web_o_s_tablet() && !detect_android())
        return true
      end
      return false
    end

=begin
*
     * Detects if the current device is an Archos media player/Internet tablet.
     * @return detection of an Archos media player

=end
    def detect_archos()
      if (user_agent.include?(DEVICE_ARCHOS))
        return true
      end
      return false
    end

=begin
*
     * Detects if the current browser is a Sony Mylo device.
     * @return detection of a Sony Mylo device

=end
    def detect_sony_mylo()
      if (user_agent.include?(MANU_SONY) && (user_agent.include?(QTEMBEDDED) || user_agent.include?(MYLOCOM2)))
        return true
      end
      return false
    end

=begin
*
     * The longer and more thorough way to detect for a mobile device.
     *   Will probably detect most feature phones,
     *   smartphone-class devices, Internet Tablets,
     *   Internet-enabled game consoles, etc.
     *   This ought to catch a lot of the more obscure and older devices, also --
     *   but no promises on thoroughness!
     * @return detection of any mobile device using the more thorough method

=end
    def detect_mobile_long()
      if (detect_mobile_quick() || detect_game_console() || detect_sony_mylo())
        return true
      end


      if (user_agent.include?(UPLINK))
        return true
      end
      if (user_agent.include?(MANU_SONY_ERICSSON))
        return true
      end
      if (user_agent.include?(MANUERICSSON))
        return true
      end
      if (user_agent.include?(MANU_SAMSUNG1))
        return true
      end

      if (user_agent.include?(SVC_DOCOMO))
        return true
      end
      if (user_agent.include?(SVC_KDDI))
        return true
      end
      if (user_agent.include?(SVC_VODAFONE))
        return true
      end

      return false
    end





=begin
*
     * The quick way to detect for a tier of devices.
     *   This method detects for the new generation of
     *   HTML 5 capable, larger screen tablets.
     *   Includes iPad, Android (e.g., Xoom), BB Playbook, WebOS, etc.
     * @return detection of any device in the Tablet Tier

=end
    def detect_tier_tablet()
      if (detect_ipad() || detect_android_tablet() || detect_black_berry_tablet() || detect_web_o_s_tablet())
        return true
      end
      return false
    end

=begin
*
     * The quick way to detect for a tier of devices.
     *   This method detects for devices which can
     *   display iPhone-optimized web content.
     *   Includes iPhone, iPod Touch, Android, Windows Phone 7, Palm WebOS, etc.
     * @return detection of any device in the iPhone/Android/WP7/WebOS Tier

=end
    def detect_tier_iphone()
      if (is_iphone || is_android_phone || (detect_black_berry_web_kit() && detect_black_berry_touch()) || detect_windows_phone7() || detect_palm_web_o_s() || detect_garmin_nuvifone())
        return true
      end
      return false
    end

=begin
*
     * The quick way to detect for a tier of devices.
     *   This method detects for devices which are likely to be capable
     *   of viewing CSS content optimized for the iPhone,
     *   but may not necessarily support JavaScript.
     *   Excludes all iPhone Tier devices.
     * @return detection of any device in the 'Rich CSS' Tier

=end
    def detect_tier_rich_css()
      result = false


      if (detect_mobile_quick())


        if (!detect_tier_iphone() && !detect_kindle())




          if (detect_webkit() || detect_s60_oss_browser() || detect_black_berry_high() || detect_windows_mobile() || user_agent.include?(ENGINE_TELECA_Q))
            result= true
          end
        end
      end
      return result
    end

=begin
*
     * The quick way to detect for a tier of devices.
     *   This method detects for all other types of phones,
     *   but excludes the iPhone and RichCSS Tier devices.
     * @return detection of a mobile device in the less capable tier

=end
    def detect_tier_other_phones()

      if (detect_mobile_long() && !detect_tier_iphone() && !detect_tier_rich_css())
        return true
      end
      return false
    end
  end
end
