class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7cdfcafc173294742a34785acf55a0c649bf4c94052bb95b0ef81ec1ded36289" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f5b67014c36b838ad0d77d7565576d8d0b8919f7911c7df3f380c781cba0310d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "477c751e2af6ee30145766269f975596fa94506b15cd9280c13b0398d256bffa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2307+1b8f7e46f.tar.xz"
  version "0.12.0-dev.2307+1b8f7e46f"
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
