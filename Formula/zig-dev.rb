class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0da38455ba6d24b5091269e95cf21141eb0035b0a8bceee0c31d010e61a1b4e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f0ea46682698b5a32e926dfa6671384e33f6d181e5ed0712069a099911863252" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6ce72d84293469d5a9d833bd14264ed52246aaa0c39424159099c633781a1c06" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2469+aa45854ec.tar.xz"
  version "0.11.0-dev.2469+aa45854ec"
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
