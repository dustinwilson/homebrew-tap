class Docopts < Formula
  version "0.6.4-with-no-mangle-double-dash"
  desc "Command-line interface description language - for shell"
  homepage "https://github.com/docopt/docopts"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/docopt/docopts/releases/download/v#{version}/docopts_darwin_amd64"
    sha256 "4d8a9a527e01b9546c99e1666422c377d55da4a1a98d53e48964cf4efd4532a9"

    def install
      bin.install "docopts_darwin_amd64" => "docopts"
    end
  elsif Hardware::CPU.arm?
    # https://github.com/docopt/docopts/archive/refs/tags/v0.6.4-with-no-mangle-double-dash.tar.gz
    url "https://github.com/docopt/docopts/archive/refs/tags/v#{version}.tar.gz"
    sha256 "5bf29a4eaa07cb3d1449077697d8746678cc490ee3e63cfe3e1025cebf2f4008"

    depends_on "go" => :build

    def install
      system "go", "get", "github.com/docopt/docopt-go"
      system "go", "build", "docopts.go"
    end
  end
end
