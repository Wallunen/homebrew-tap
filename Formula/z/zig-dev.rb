class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260713-021245"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "abb6d2ca3cd58413f6439bf24ce4c0121b21115257bc61ef4486d54bb6a7eaf8"
    sha256 cellar: :any_skip_relocation, sequoia:      "da5156bbe6df12d0de77ecfb38011453015fce715d656d5d2e9e962f70480447"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ab8e946982f1261dc56e6745a108f5b2796d8a5b4abce48408c61b242e04e2e2"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "769efcab993b956f91c1d8d989023f9b74c839ea219bdc08b642920f0d964d23" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8af1c24715f9402ff601b1f7b93e874bc44615700b830addc88b92b83aeb8a0d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e57c2e2efcf6c6b20260965517ec1227cb56e34506b06759b062654a6f51c52" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1387+01b60634c.tar.xz"
  version "0.17.0-dev.1387+01b60634c"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
