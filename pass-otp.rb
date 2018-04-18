class PassOtp < Formula
  desc "A pass extension for managing one-time-password (OTP) tokens"
  homepage "https://github.com/tadfisher/pass-otp"
  url "https://github.com/tadfisher/pass-otp/archive/v1.1.0.tar.gz"
  version "1.1.0"
  sha256 "3971467475f8ed573eb860c7a44bd268d464d169dddbc0a4da89232d5beee144"

  depends_on "oath-toolkit"
  depends_on "pass"

  def install
    system "make install PREFIX=#{prefix}"
  end
end
