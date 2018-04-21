class Browserpass < Formula
  desc "Native component for Chrome & Firefox password management add-on"
  homepage "https://github.com/browserpass/browserpass"
  url "https://github.com/browserpass/browserpass/archive/2.0.21.tar.gz"
  version "2.0.21"
  sha256 "df318a98187e718a49d9d579c0184e39d41a8b8e6f53ddb9a7d8efab8ee2fcac"

  depends_on "go" => :build
  depends_on "gnupg"
  depends_on "pinentry-mac"

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/dannyvankooten/browserpass").install buildpath.children
    cd "src/github.com/dannyvankooten/browserpass" do
      # Install go dependencies
      system "go get github.com/gokyle/twofactor github.com/mattn/go-zglob github.com/sahilm/fuzzy"
      system "make", "browserpass-darwinx64"
      mkdir "out"
      mkdir "out/bin"
      mkdir "out/share"
      cp "browserpass-darwinx64", "out/bin/browserpass"
      cp "install.sh", "out/bin/browserpass-setup"
      cp "firefox/host.json", "out/share/firefox-host.json"
      cp "chrome/host.json", "out/share/chrome-host.json"
      cp "chrome/policy.json", "out/share/chrome-policy.json"
      dir = csh_quote(HOMEBREW_PREFIX)
      inreplace "out/bin/browserpass-setup", /^(BIN_DIR=).*$/, "\\1\"#{dir}/bin\""
      inreplace "out/bin/browserpass-setup", /^(JSON_DIR=).*$/, "\\1\"#{dir}/share/browserpass\""
      bin.install Dir["out/bin/*"]
      pkgshare.install Dir["out/share/*"]
    end
  end

  def caveats; <<~EOS
    To complete installation of browserpass, do the following:

    1. Install the browserpass-ce add-on in your browser.
        * Chrome: https://chrome.google.com/webstore/detail/browserpass-ce/naepdomgkenhinolocfifgehidddafch
        * Firefox: https://addons.mozilla.org/en-US/firefox/addon/browserpass-ce/
    2. Run `browserpass-setup` to install browser-specific manifest files.

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
