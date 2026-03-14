class Cdparanoia < Formula
  desc "Audio extraction tool for CDs"
  homepage "https://www.xiph.org/paranoia/"
  url "https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-10.2.src.tgz"
  sha256 "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"
  license all_of: ["GPL-2.0-or-later", "LGPL-2.1-or-later"]

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  patch do
    url "https://raw.githubusercontent.com/dustinwilson/homebrew-tap/patches/cdparanoia/cdparanoia.patch"
    sha256 "7d99da9b5e1eeb202caabbf2268427f5fdff57095b063327a529bbbd6d5eff96"
  end

  def install
    ENV.deparallelize

    system "autoreconf", "-fiv"
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--libdir=#{libexec}"
    system "make", "clean"
    system "make", "all"
    system "make", "install"
  end

  test do
    system "#{bin}/cdparanoia", "--version"
  end
end
