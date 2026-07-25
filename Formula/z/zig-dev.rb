class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260724-172413"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a8dd4dcb8f52c72e4d093a06c61abd1716cb3f2f4fc9d8b0195b66e4f42ca36c"
    sha256 cellar: :any_skip_relocation, sequoia:      "3915df99e592e4a9158491402c85b116df126fda35d61d764569fe37fd30148d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f50d4ef45299c6c62a0b7243044cd3cd3508d3a69562216aede1064e0829972"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c4a2008dd94901b83d06459988f440249000aba404069bd2c65fbc23cec909d7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18a03db17c4505506dd0258132a4b6d7aa1c8c2ac002d41faf4733581412a34d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f0fcc0f1d028a983eb66d873adf2687b504a710789dcc52409a5535c3ddbedc2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1464+6aff551f1.tar.xz"
  version "0.17.0-dev.1464+6aff551f1"
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
