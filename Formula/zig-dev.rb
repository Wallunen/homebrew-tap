class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3fa8c690435bfac85df7812baf8358d71caae54b4dd3730276c0295ac8f69e7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8ca7bb142fc397e1f5e70d30ce8399970aeab8e8a2fa44a52656460a1edff27d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d18becce516cec8ff3b19d49cb6a0adcf1d4f01feb0c1fbe5020beedce1e5e25" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3724+32cb9462f.tar.xz"
  version "0.11.0-dev.3724+32cb9462f"
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
