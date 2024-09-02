class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bdec2543ec475ddd8a732521ffc719b8c2ac870ddf3a4836dca931136bdd107d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "21c6c2c9f775c48a2f985ca74735e10d75f99ef0f8cb3f17046605c7fd18c2b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8140c4b0ccc36530c52b7b9913c9163bbf00721b26966dce7cf4711a07468b5c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1402+cad65307b.tar.xz"
  version "0.14.0-dev.1402+cad65307b"
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
