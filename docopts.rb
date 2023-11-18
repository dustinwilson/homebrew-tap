class Docopts < Formula
  version "0.6.4-with-no-mangle-double-dash"
  desc "Command-line interface description language - for shell"
  homepage "https://github.com/docopt/docopts"
  url "https://github.com/docopt/docopts/releases/download/v#{version}/docopts_darwin_amd64"
  sha256 "4d8a9a527e01b9546c99e1666422c377d55da4a1a98d53e48964cf4efd4532a9"
  license "MIT"

  def install
    bin.install "docopts_darwin_amd64" => "docopts"
  end
end
