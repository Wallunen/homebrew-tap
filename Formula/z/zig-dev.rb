class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260813-012503"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2dad340e35f8924a1caaed6126e1de8b3669847856a129d6177ec9a90f321340"
    sha256 cellar: :any_skip_relocation, sequoia:      "e38604f5e4ffa539b925ea517b4d83cca56c58f28307c44a79295caa3759db23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e19d70269143ac84aa25a98bd1d62b49b3c55caaebba5f20569fa71eece9e211"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7af186910ea7187a8b2834977b7b9f657b47aca952120c2bf280b2a14a134b9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78fb9f0e0f19f789ae45e8ac5d1c56b88499e0d476ac08f004ba2de4777e1f91" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a68df95449e152d78ad3940643fb16b925d273411164295cfa12a4621e85b1da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1737+de207594e.tar.xz"
  version "0.17.0-dev.1737+de207594e"
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
