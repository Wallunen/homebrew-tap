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
      sha256 "b52f1be4737543d93e400db8f4caf87ab0855599fca847a08435f817559829a9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4691c70c37ed9e80feb3b8a9eaa7e1f01fe97b72fe8895fee42a95c2c0019943" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "31e29f9584c14fa2d51c0e1c2310515ba4817d6a28074999a3d85c4b5bb229ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2015+3fdcbc03d.tar.xz"
  version "0.17.0-dev.2015+3fdcbc03d"
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
