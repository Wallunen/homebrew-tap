class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260825-005651"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "16e68466acbd0f1aed996482b51e6a40c3eb44cacb0f1947883350671cb4f3a9"
    sha256 cellar: :any_skip_relocation, sequoia:      "e998da5ebccf63cd0f3fc27f79d01e42582cbc733395e67315e2c44bc81afc4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fcfec46141e20a707846f7d9c447c2c9b6435e21851e7e30900ed527014eed1a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a84427195a7e34a648d4422f0c5c200092f78d505b6b32b7b7c2065b52171c34" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "15b4f61156976459d4708cab2baf22f003d414a3b19c89a289c52cd0e492993b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "14d6512cec0aafa658d56f3534d30ce4825e870b2f2aac280040565645fdc81e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1859+dcceb318e.tar.xz"
  version "0.17.0-dev.1859+dcceb318e"
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
