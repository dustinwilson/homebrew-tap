class Rsgain < Formula
  desc "A simple, but powerful ReplayGain 2.0 tagging utility"
  homepage "https://github.com/complexlogic/rsgain"
  version "3.6"
  url "https://github.com/complexlogic/rsgain/releases/download/v#{version}/rsgain-#{version}-source.tar.xz"
  sha256 "26d46f1240a83366e82cbc9121a467fc1dcc977c7adfb4e15c99ead6b3d07ec8"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg"
  depends_on "libebur128"
  depends_on "taglib"
  depends_on "inih"
  depends_on "fmt"

  def install
    sdk = MacOS.sdk_path

    system "cmake", "-S", ".", "-B", "build",
                    "-DCMAKE_CXX_FLAGS=-stdlib=libc++ -isystem #{sdk}/usr/include/c++/v1",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "rsgain #{version} - using:", shell_output("#{bin}/rsgain -v").strip
  end
end