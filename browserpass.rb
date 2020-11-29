class Browserpass < Formula
  version "3.0.7"
  desc "Native component for Chrome & Firefox password management add-on"
  homepage "https://github.com/browserpass/browserpass-native"
  url "https://github.com/browserpass/browserpass-native/releases/download/#{version}/browserpass-darwin64-#{version}.tar.gz"
  sha256 "97b9a9068a3c88fb1d52d42a1712e199da5865a4c6f8352b9fe3eae1ee86c746"

  depends_on "coreutils" => :build
  depends_on "gpg"
  depends_on "gnupg"
  depends_on "gnu-sed" => :build
  depends_on "pinentry"
  depends_on "pinentry-mac"

  def install
    ENV["DESTDIR"] = ""
    ENV["PREFIX"] = prefix.to_s
    inreplace "Makefile", "BIN = browserpass", "BIN = browserpass-darwin64"

    system "make", "configure"
    system "make", "install"

    data= <<-EOS
#!/usr/bin/env bash
BROWSER="$1"

if [ -z "$BROWSER" ]; then
    echo ""
    echo "Select your browser:"
    echo "===================="
    echo "1) Brave"
    echo "2) Chrome"
    echo "3) Chromium"
    echo "4) Firefox"
    echo "5) Vivaldi"
    echo -n "1-5: "
    read BROWSER
    echo ""
fi

# Set target dir from user input
case $BROWSER in
1|[Bb]rave)
    BROWSER_NAME="brave"
;;
2|[Cc]hrome)
    BROWSER_NAME="chrome"
;;
3|[Cc]hromium)
    BROWSER_NAME="chromium"
;;
4|[Ff]irefox)
    BROWSER_NAME="firefox"
;;
5|[Vv]ivaldi)
    BROWSER_NAME="vivaldi"
;;
*)
    echo "Invalid selection. Please select 1-5 or one of the browser names."
    exit 1
;;
esac

PREFIX='/usr/local/opt/browserpass' make hosts-${BROWSER_NAME}-user -f /usr/local/opt/browserpass/lib/browserpass/Makefile
    EOS

    File.open("#{bin}/browserpass-setup", File::WRONLY|File::CREAT) { |f|
      f.write(data)
    }

    system "chmod", "555", "#{bin}/browserpass-setup"
  end

  def caveats; <<~EOS
    To complete installation of browserpass, do the following:

    1. Install the browserpass extension in your browser.
        * Chrome & Chromium flavors: https://chrome.google.com/webstore/detail/browserpass/naepdomgkenhinolocfifgehidddafch
        * Firefox: https://addons.mozilla.org/en-US/firefox/addon/browserpass-ce/
    2. Optionally install the browserpass-otp extension in your browser for OTP support.
        * Chrome & Chromium flavors: https://chrome.google.com/webstore/detail/browserpass-otp/afjjoildnccgmjbblnklbohcbjehjaph
        * Firefox: https://addons.mozilla.org/en-US/firefox/addon/browserpass-otp/
    3. Run `browserpass-setup` to install browser-specific manifest files.

    The addon will not work otherwise.
    EOS
  end

  test do
    mkdir "#{ENV["HOME"]}/.password-store"
    json = { :action => "search", :domain => "test" }
    msg = JSON.generate(json)
    Open3.popen3("#{bin}/browserpass") do |stdin, stdout, _|
      stdin.write([msg.bytesize].pack("L"))
      stdin.write(msg)
      stdin.close
      len = stdout.read(4).unpack("L")[0]
      result = JSON.parse(stdout.read(len))
      assert_equal(result, [])
    end
  end
end