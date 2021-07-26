class Docopts < Formula
  version "0.6.1+fix"
  desc "Command-line interface description language - for shell"
  homepage "https://github.com/docopt/docopts"
  url "https://github.com/docopt/docopts/archive/refs/tags/v0.6.1+fix.tar.gz"
  sha256 "535cb8abca7328a1e6ff7ada418f84a7baf668faf5a75fed3daccc69c646541f"
  license "MIT"

  depends_on "bash"
  depends_on "python"

  def install
    inreplace "docopts", "#!/usr/bin/env python", "#!/usr/bin/env python3"
    system "pip3", "install", "docopt"
    bin.install "docopts"
  end
end
