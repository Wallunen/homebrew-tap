class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260905-113222"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "abafed842a3965a181374eedf73f42aaef62e666ed8a5aa7c45063530cd5860a"
    sha256 cellar: :any_skip_relocation, sequoia:      "52b8c04cf90b328534c862d678ae8fa96e86f0c807a97b543e7f95b8644e32c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7d5123d587bf4d2b026b1b1be75aa223a6a1f3e0b5afbeff30054e518c985fdc"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64b055c1f00414f83a9226e592058da04e349ec019d95bc360b0b7e784245ad9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "046224530c77221ba35521b127e267cec4ec0b98e6efca5b84fd1277dd157b3b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7d591c41b29b463c226661bbbb4e4f95676ed9318a31f7bfafc1995c69a99129" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2018+ab30a0b9a.tar.xz"
  version "0.17.0-dev.2018+ab30a0b9a"
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
