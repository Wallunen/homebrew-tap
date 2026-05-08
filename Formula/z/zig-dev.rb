class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260507-101832"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9f00862324e11384cea3fe8830ef59a9de950d2958caaf6a962069de73f29306"
    sha256 cellar: :any_skip_relocation, sequoia:      "142b325bb7e8675e87831680c2b3ab559fea7b7d6cdc13e376ac3b570a723282"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4698d8b6958f870f7f7d65a17a8705a085e4d55d2bfb880e618473f72a304fea"
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
