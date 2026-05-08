class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260508-023459"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0d8968d015f4c4a57ff30dae801689764e6ee3c05327ffd06a21a84bfeb75686"
    sha256 cellar: :any_skip_relocation, sequoia:      "c6ab222e210c5b56e6865c3d026f7e7d97dc61d7a7d06306f3cff788b2e21c2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5793e3fe61c05b4826c450090f7ea98f11f4f41d5cf0c2e6078a3b58bf9a6a3"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5f5fde220ffe693fb4f32456327deb1d6b1147cab01104190764264a8288a1d3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e518d3046e6b13d596ead24d2a7e58b260f66ff1ea4e2b0985aa277f28c24bde" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0830fb0c6e27766660efe97c26dcae1117319a27a55b50cdd88bfc5e2e6dda3b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.263+0add2dfc4.tar.xz"
  version "0.17.0-dev.263+0add2dfc4"
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
