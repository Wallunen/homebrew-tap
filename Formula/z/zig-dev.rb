class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260823-005902"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7501ee2ee053080d9b062984e3ced4ba4bd969edace0782c1746f641abe381cb"
    sha256 cellar: :any_skip_relocation, sequoia:      "4aac76064e72541721d82f58c143867c9fb794d411311ffa0754230a647efe96"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1d05f27e60c0ba02ffe5bade18bd3728b6f531094476eb79600e28ef88c779d"
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
