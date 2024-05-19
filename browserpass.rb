class Browserpass < Formula
  version "3.1.0"
  desc "Native component for Chrome & Firefox password management add-on"
  homepage "https://github.com/browserpass/browserpass-native"

  if Hardware::CPU.intel?
    url "https://github.com/browserpass/browserpass-native/releases/download/#{version}/browserpass-darwin64-#{version}.tar.gz"
    sha256 "a27c2a174511fbc32b1bc2571398f3371a86606f62c717223559b2268d75ce51"
  elsif Hardware::CPU.arm?
    url "https://github.com/browserpass/browserpass-native/releases/download/#{version}/browserpass-darwin-arm64-#{version}.tar.gz"
    sha256 "3f5b32ce32c9661034825d9bdd23dc183041563a7fa29aa72b0628fb87c20c42"
  end

  depends_on "coreutils" => :build
  depends_on "gpg"
  depends_on "gnupg"
  depends_on "gnu-sed" => :build
  depends_on "pinentry"
  depends_on "pinentry-mac"

  def install
    ENV["DESTDIR"] = ""
    ENV["PREFIX"] = prefix.to_s

    if Hardware::CPU.intel?
      inreplace "Makefile", "BIN ?= browserpass", "BIN ?= browserpass-darwin64"
    elsif Hardware::CPU.arm?
      inreplace "Makefile", "BIN ?= browserpass", "BIN ?= browserpass-darwin-arm64"
    end

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

PREFIX='#{HOMEBREW_PREFIX}/opt/browserpass' make hosts-${BROWSER_NAME}-user -f #{HOMEBREW_PREFIX}/opt/browserpass/lib/browserpass/Makefile
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